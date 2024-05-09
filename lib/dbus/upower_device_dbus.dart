// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object /usr/share/dbus-1/interfaces/org.freedesktop.UPower.Device.xml

import 'package:dbus/dbus.dart';

class OrgFreedesktopUPowerDevice extends DBusRemoteObject {
  OrgFreedesktopUPowerDevice(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/')})
      : super(client, name: destination, path: path);

  /// Gets org.freedesktop.UPower.Device.Luminosity
  Future<double> getLuminosity() async {
    var value = await getProperty('org.freedesktop.UPower.Device', 'Luminosity',
        signature: DBusSignature('d'));
    return value.asDouble();
  }

  Future<void> callRefresh(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.UPower.Device', 'Refresh', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
