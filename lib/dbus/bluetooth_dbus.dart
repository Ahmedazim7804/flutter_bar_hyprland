import 'package:bar/models/bluetooth_model.dart';
import 'package:dbus/dbus.dart';
import 'dart:async';
import 'package:async/async.dart';

class OrgBluezInterfaceAdded extends DBusSignal {
  DBusObjectPath get device => values[0].asObjectPath();

  OrgBluezInterfaceAdded(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class OrgBluezInterfaceRemoved extends DBusSignal {
  DBusObjectPath get device => values[0].asObjectPath();

  OrgBluezInterfaceRemoved(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class OrgBluezHCI0 extends DBusRemoteObject {
  bool isBluetoothEnabled = false;
  bool isBluetoothDiscovering = false;
  final StreamController<bool> bluetoothEnabled = StreamController<bool>();
  final StreamController<bool> bluetoothDiscovering = StreamController<bool>();
  OrgBluezHCI0(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/hci0')})
      : super(client, name: destination, path: path);

  Future<void> intialize() async {
    final allProps = await getAllProperties('org.bluez.Adapter1');

    isBluetoothEnabled = allProps['Powered']!.asBoolean();
    isBluetoothDiscovering = allProps['Discovering']!.asBoolean();

    _startBluetoothHardwareStream();
  }

  void _startBluetoothHardwareStream() {
    propertiesChanged.listen((event) {
      if (event.changedProperties.containsKey('Powered')) {
        bool value = event.changedProperties['Powered']!.asBoolean();
        isBluetoothEnabled = value;
        bluetoothEnabled.sink.add(value);
      }

      if (event.changedProperties.containsKey('Discovering')) {
        bool value = event.changedProperties['Discovering']!.asBoolean();
        isBluetoothDiscovering = value;
        bluetoothEnabled.sink.add(value);
      }
    });
  }
}

class OrgBluez extends DBusRemoteObject {
  late final Stream<OrgBluezInterfaceAdded> interfaceAdded;
  late final Stream<OrgBluezInterfaceRemoved> interfaceRemoved;

  final List<BluetoothDevice> allDevices = [];
  final List<BluetoothDevice> connectedDevices = [];

  // late final Stream changesInDevices;
  final StreamController<List<BluetoothDevice>> connectedDevicesStream =
      StreamController<List<BluetoothDevice>>();

  OrgBluez(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/')})
      : super(client, name: destination, path: path) {
    interfaceAdded = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.DBus.ObjectManager',
            name: 'InterfacesAdded',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => OrgBluezInterfaceAdded(signal));

    interfaceRemoved = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.DBus.ObjectManager',
            name: 'InterfacesRemoved',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => OrgBluezInterfaceRemoved(signal));
  }

  Future<List<BluetoothDevice>> getConnectedDevices(
      {bool refresh = false}) async {
    if (refresh) {
      await getAllDevices();
    }

    connectedDevices.clear();

    for (var device in allDevices) {
      if (device.connected) {
        connectedDevices.add(device);
      }
    }

    return connectedDevices;
  }

  Future<void> intialize() async {
    await getAllDevices();

    for (var device in allDevices) {
      if (device.connected) {
        connectedDevices.add(device);
      }
    }

    _startConnectedDeviceStream();
  }

  void _startConnectedDeviceStream() {
    final Stream<DBusPropertiesChangedSignal> streamGroup = StreamGroup.merge(
        allDevices
            .map((device) => getStreamOfBluetoothDevice(device))
            .toList());

    streamGroup.listen((event) async {
      connectedDevicesStream.sink.add(await getConnectedDevices(refresh: true));
    });
  }

  Stream<DBusPropertiesChangedSignal> getStreamOfBluetoothDevice(
      BluetoothDevice bluetoothDevice) {
    final DBusRemoteObject dBusRemoteObject =
        DBusRemoteObject(client, name: name, path: bluetoothDevice.interface);
    return dBusRemoteObject.propertiesChanged;
  }

  Future<List<BluetoothDevice>> getAllDevices() async {
    allDevices.clear();
    final objects = (await getObjectManagersObjects()).first.asDict();

    for (var element in objects.entries) {
      if (element.key.asString().contains('/dev_') &&
          !element.key.asString().contains('/sep')) {
        final unparsedProps = element.value.asDict();

        if (!unparsedProps.keys
            .contains(const DBusString('org.bluez.Device1'))) {
          continue;
        }

        final props = unparsedProps[const DBusString('org.bluez.Device1')]!
            .asDict()
            .map((key, value) => MapEntry(key.asString(), value.asVariant()));

        if (props.keys.contains("UUIDs")) {
          if (props['UUIDs']!.asArray().isEmpty) {
            continue;
          }
        } else {
          continue;
        }

        BluetoothDevice bluetoothDevice = BluetoothDevice.fromMap(
            props, DBusObjectPath(element.key.asString()));
        allDevices.add(bluetoothDevice);
      }
    }

    return allDevices;
  }

  Future<List<DBusValue>> getObjectManagersObjects() async {
    return (await callMethod(
      'org.freedesktop.DBus.ObjectManager',
      'GetManagedObjects',
      [],
      replySignature: DBusSignature('a{oa{sa{sv}}}'),
    ))
        .returnValues;
  }
}
