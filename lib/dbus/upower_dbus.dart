// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object /usr/share/dbus-1/interfaces/org.freedesktop.UPower.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

enum BatteryState {
  UNKNOWN(0),
  CHARGING(1),
  DISCHARGING(2),
  EMPTY(3),
  FULLY_CHARGED(4),
  PENDING_CHARGE(5),
  PENDING_DISCHARGE(6);

  const BatteryState(this.value);
  final int value;

  static BatteryState fromValue(int value) {
    if (value == 0) {
      return BatteryState.UNKNOWN;
    } else if (value == 1) {
      return BatteryState.CHARGING;
    } else if (value == 2) {
      return BatteryState.DISCHARGING;
    } else if (value == 3) {
      return BatteryState.EMPTY;
    } else if (value == 4) {
      return BatteryState.FULLY_CHARGED;
    } else if (value == 5) {
      return BatteryState.PENDING_CHARGE;
    } else if (value == 6) {
      return BatteryState.PENDING_DISCHARGE;
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

class OrgFreedesktopUPowerBatteryState extends DBusSignal {
  int get newState => values[0].asInt32();

  OrgFreedesktopUPowerBatteryState(DBusSignal signal)
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
  }

  /// Gets org.freedesktop.UPower.DaemonVersion
  Future<String> getDaemonVersion() async {
    var value = await getProperty('org.freedesktop.UPower', 'DaemonVersion',
        signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.UPower.OnBattery
  Future<bool> getOnBattery() async {
    var value = await getProperty('org.freedesktop.UPower', 'OnBattery',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.LidIsClosed
  Future<bool> getLidIsClosed() async {
    var value = await getProperty('org.freedesktop.UPower', 'LidIsClosed',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.LidIsPresent
  Future<bool> getLidIsPresent() async {
    var value = await getProperty('org.freedesktop.UPower', 'LidIsPresent',
        signature: DBusSignature('b'));
    return value.asBoolean();
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
