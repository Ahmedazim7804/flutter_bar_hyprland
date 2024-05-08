import 'package:dbus/dbus.dart';

class BluetoothService {
  BluetoothService({
    required this.connectedDevices,
    required this.enabled,
    required this.discovering,
  });
  final List<BluetoothDevice> connectedDevices;
  final bool enabled;
  final bool discovering;
}

class BluetoothDevice {
  BluetoothDevice(
      {required this.name,
      required this.interface,
      required this.address,
      required this.alias,
      required this.icon,
      required this.paired,
      required this.trusted,
      required this.bonded,
      required this.connected,
      required this.servicesResolved});

  final String name;
  final DBusObjectPath interface;
  final String address;
  final String alias;
  final String icon;
  final bool paired;
  final bool trusted;
  final bool bonded;
  final bool connected;
  final bool servicesResolved;

  factory BluetoothDevice.fromMap(
      Map<String, dynamic> map, DBusObjectPath interface) {
    final address = map['Address']!.asString();
    final name = map['Name']!.asString();
    final alias = map['Alias']!.asString();
    final icon = map['Icon']!.asString();
    final paired = map['Paired']!.asBoolean();
    final trusted = map['Trusted']!.asBoolean();
    final bonded = map['Bonded']!.asBoolean();
    final connected = map['Connected']!.asBoolean();
    final servicesResolved = map['ServicesResolved']!.asBoolean();

    return BluetoothDevice(
      name: name,
      interface: interface,
      address: address,
      alias: alias,
      icon: icon,
      paired: paired,
      trusted: trusted,
      bonded: bonded,
      connected: connected,
      servicesResolved: servicesResolved,
    );
  }
}
