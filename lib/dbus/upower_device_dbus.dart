// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object /usr/share/dbus-1/interfaces/org.freedesktop.UPower.Device.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgFreedesktopUPowerDevice extends DBusRemoteObject {
  OrgFreedesktopUPowerDevice(DBusClient client, String destination, {DBusObjectPath path = const DBusObjectPath.unchecked('/')}) : super(client, name: destination, path: path);

  /// Gets org.freedesktop.UPower.Device.NativePath
  Future<String> getNativePath() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'NativePath', signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.UPower.Device.Vendor
  Future<String> getVendor() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Vendor', signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.UPower.Device.Model
  Future<String> getModel() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Model', signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.UPower.Device.Serial
  Future<String> getSerial() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Serial', signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.UPower.Device.UpdateTime
  Future<int> getUpdateTime() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'UpdateTime', signature: DBusSignature('t'));
    return value.asUint64();
  }

  /// Gets org.freedesktop.UPower.Device.Type
  Future<int> getType() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Type', signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.UPower.Device.PowerSupply
  Future<bool> getPowerSupply() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'PowerSupply', signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.Device.HasHistory
  Future<bool> getHasHistory() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'HasHistory', signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.Device.HasStatistics
  Future<bool> getHasStatistics() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'HasStatistics', signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.Device.Online
  Future<bool> getOnline() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Online', signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.Device.Energy
  Future<double> getEnergy() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Energy', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.EnergyEmpty
  Future<double> getEnergyEmpty() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'EnergyEmpty', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.EnergyFull
  Future<double> getEnergyFull() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'EnergyFull', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.EnergyFullDesign
  Future<double> getEnergyFullDesign() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'EnergyFullDesign', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.EnergyRate
  Future<double> getEnergyRate() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'EnergyRate', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.Voltage
  Future<double> getVoltage() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Voltage', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.ChargeCycles
  Future<int> getChargeCycles() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'ChargeCycles', signature: DBusSignature('i'));
    return value.asInt32();
  }

  /// Gets org.freedesktop.UPower.Device.Luminosity
  Future<double> getLuminosity() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Luminosity', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.TimeToEmpty
  Future<int> getTimeToEmpty() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'TimeToEmpty', signature: DBusSignature('x'));
    return value.asInt64();
  }

  /// Gets org.freedesktop.UPower.Device.TimeToFull
  Future<int> getTimeToFull() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'TimeToFull', signature: DBusSignature('x'));
    return value.asInt64();
  }

  /// Gets org.freedesktop.UPower.Device.Percentage
  Future<double> getPercentage() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Percentage', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.Temperature
  Future<double> getTemperature() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Temperature', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.IsPresent
  Future<bool> getIsPresent() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'IsPresent', signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.Device.State
  Future<int> getState() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'State', signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.UPower.Device.IsRechargeable
  Future<bool> getIsRechargeable() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'IsRechargeable', signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.UPower.Device.Capacity
  Future<double> getCapacity() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Capacity', signature: DBusSignature('d'));
    return value.asDouble();
  }

  /// Gets org.freedesktop.UPower.Device.Technology
  Future<int> getTechnology() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Technology', signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.UPower.Device.WarningLevel
  Future<int> getWarningLevel() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'WarningLevel', signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.UPower.Device.BatteryLevel
  Future<int> getBatteryLevel() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'BatteryLevel', signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.UPower.Device.IconName
  Future<String> getIconName() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'IconName', signature: DBusSignature('s'));
    return value.asString();
  }

  /// Invokes org.freedesktop.UPower.Device.Refresh()
  Future<void> callRefresh({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.UPower.Device', 'Refresh', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.UPower.Device.GetHistory()
  Future<List<List<DBusValue>>> callGetHistory(String type, int timespan, int resolution, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.freedesktop.UPower.Device', 'GetHistory', [DBusString(type), DBusUint32(timespan), DBusUint32(resolution)], replySignature: DBusSignature('a(udu)'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asArray().map((child) => child.asStruct()).toList();
  }

  /// Invokes org.freedesktop.UPower.Device.GetStatistics()
  Future<List<List<DBusValue>>> callGetStatistics(String type, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.freedesktop.UPower.Device', 'GetStatistics', [DBusString(type)], replySignature: DBusSignature('a(dd)'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asArray().map((child) => child.asStruct()).toList();
  }
}
