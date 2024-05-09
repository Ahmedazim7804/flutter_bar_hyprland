// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object /usr/share/dbus-1/interfaces/org.freedesktop.UPower.xml

import 'dart:async';
import 'package:dbus/dbus.dart';

enum BatteryCharging {
  UNKNOWN(0),
  CHARGING(1),
  DISCHARGING(2),
  EMPTY(3),
  FULLY_CHARGED(4),
  PENDING_CHARGE(5),
  PENDING_DISCHARGE(6);

  const BatteryCharging(this.value);
  final int value;

  static BatteryCharging fromValue(int value) {
    if (value == 0) {
      return BatteryCharging.UNKNOWN;
    } else if (value == 1) {
      return BatteryCharging.CHARGING;
    } else if (value == 2) {
      return BatteryCharging.DISCHARGING;
    } else if (value == 3) {
      return BatteryCharging.EMPTY;
    } else if (value == 4) {
      return BatteryCharging.FULLY_CHARGED;
    } else if (value == 5) {
      return BatteryCharging.PENDING_CHARGE;
    } else if (value == 6) {
      return BatteryCharging.PENDING_DISCHARGE;
    } else {
      throw ArgumentError('Invalid value: $value');
    }
  }
}

/// Signal data for org.freedesktop.UPower.DeviceAdded.
class OrgFreedesktopUPowerDeviceAdded extends DBusSignal {
  DBusObjectPath get device => values[0].asObjectPath();

  OrgFreedesktopUPowerDeviceAdded(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class OrgFreedesktopUPowerBatteryChargingState extends DBusSignal {
  int get newState => values[0].asInt32();

  OrgFreedesktopUPowerBatteryChargingState(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.freedesktop.UPower.DeviceRemoved.
class OrgFreedesktopUPowerDeviceRemoved extends DBusSignal {
  DBusObjectPath get device => values[0].asObjectPath();

  OrgFreedesktopUPowerDeviceRemoved(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class OrgFreedesktopUPower extends DBusRemoteObject {
  /// Stream of org.freedesktop.UPower.DeviceAdded signals.
  late final Stream<OrgFreedesktopUPowerDeviceAdded> deviceAdded;

  /// Stream of org.freedesktop.UPower.DeviceRemoved signals.
  late final Stream<OrgFreedesktopUPowerDeviceRemoved> deviceRemoved;

  late final Map<Set<String>, StreamController<Map<String, DBusValue?>>>
      streamMap = {};

  OrgFreedesktopUPower(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/')})
      : super(client, name: destination, path: path) {
    deviceAdded = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.UPower',
            name: 'DeviceAdded',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => OrgFreedesktopUPowerDeviceAdded(signal));

    deviceRemoved = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.UPower',
            name: 'DeviceRemoved',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => OrgFreedesktopUPowerDeviceRemoved(signal));

    listenForPropertiesChanges();
  }

  Stream<Map<String, DBusValue?>> getStreamOf(Set<String> props) {
    if (streamMap.keys.toSet().intersection(props).isEmpty) {
      StreamController<Map<String, DBusValue?>> streamController =
          StreamController<Map<String, DBusValue?>>();
      streamMap[props] = streamController;
      return streamController.stream;
    } else {
      return streamMap[props]!.stream;
    }
  }

  Future<DBusValue?> _getProperty(String property) async {
    if (property == 'State') {
      return await getState();
    } else if (property == "Percentage") {
      return await getPercentage();
    }
    return null;
  }

  Future<void> broadcastPropChange(
      Set<String> props, Map<String, DBusValue> changedProperties) async {
    Map<String, DBusValue?> propsToBroadcast = {};

    for (String element in props) {
      if (changedProperties.containsKey(element)) {
        propsToBroadcast[element] = changedProperties[element];
      } else {
        propsToBroadcast[element] = await _getProperty(element);
      }
    }

    streamMap[props]!.sink.add(propsToBroadcast);
  }

  Future<void> listenForPropertiesChanges() async {
    propertiesChanged.listen((signal) {
      for (var props in streamMap.keys) {
        if (signal.changedProperties.keys
            .toSet()
            .intersection(props)
            .isNotEmpty) {
          broadcastPropChange(props, signal.changedProperties);
        }
      }
    });
  }

  /// Gets org.freedesktop.UPower.DaemonVersion
  Future<DBusValue> getDaemonVersion() async {
    var value = await getProperty('org.freedesktop.UPower', 'DaemonVersion',
        signature: DBusSignature('s'));
    return value;
  }

  /// Gets org.freedesktop.UPower.OnBatteryCharging
  Future<DBusValue> getOnBatteryCharging() async {
    var value = await getProperty('org.freedesktop.UPower', 'OnBatteryCharging',
        signature: DBusSignature('b'));
    return value;
  }

  Future<DBusValue> getPercentage() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Percentage',
        signature: DBusSignature('d'));
    return value;
  }

  Future<DBusValue> getState() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'State',
        signature: DBusSignature('u'));
    return value;
  }

  /// Gets org.freedesktop.UPower.LidIsClosed
  Future<DBusValue> getLidIsClosed() async {
    var value = await getProperty('org.freedesktop.UPower', 'LidIsClosed',
        signature: DBusSignature('b'));
    return value;
  }

  /// Gets org.freedesktop.UPower.LidIsPresent
  Future<DBusValue> getLidIsPresent() async {
    var value = await getProperty('org.freedesktop.UPower', 'LidIsPresent',
        signature: DBusSignature('b'));
    return value;
  }

  /// Invokes org.freedesktop.UPower.EnumerateDevices()
  Future<List<DBusObjectPath>> callEnumerateDevices(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.UPower', 'EnumerateDevices', [],
        replySignature: DBusSignature('ao'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPathArray().toList();
  }

  /// Invokes org.freedesktop.UPower.GetDisplayDevice()
  Future<DBusObjectPath> callGetDisplayDevice(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.UPower', 'GetDisplayDevice', [],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }

  /// Invokes org.freedesktop.UPower.GetCriticalAction()
  Future<String> callGetCriticalAction(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.UPower', 'GetCriticalAction', [],
        replySignature: DBusSignature('s'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asString();
  }
}
