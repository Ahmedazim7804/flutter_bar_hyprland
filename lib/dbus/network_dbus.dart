// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object /usr/share/dbus-1/interfaces/org.freedesktop.NetworkManager.xml

import 'package:dbus/dbus.dart';

/// Signal data for org.freedesktop.NetworkManager.CheckPermissions.
class OrgFreedesktopNetworkManagerCheckPermissions extends DBusSignal {
  OrgFreedesktopNetworkManagerCheckPermissions(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.freedesktop.NetworkManager.StateChanged.
class OrgFreedesktopNetworkManagerStateChanged extends DBusSignal {
  int get state => values[0].asUint32();

  OrgFreedesktopNetworkManagerStateChanged(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.freedesktop.NetworkManager.DeviceAdded.
class OrgFreedesktopNetworkManagerDeviceAdded extends DBusSignal {
  DBusObjectPath get device_path => values[0].asObjectPath();

  OrgFreedesktopNetworkManagerDeviceAdded(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.freedesktop.NetworkManager.DeviceRemoved.
class OrgFreedesktopNetworkManagerDeviceRemoved extends DBusSignal {
  DBusObjectPath get device_path => values[0].asObjectPath();

  OrgFreedesktopNetworkManagerDeviceRemoved(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class OrgFreedesktopNetworkManager extends DBusRemoteObject {
  /// Stream of org.freedesktop.NetworkManager.CheckPermissions signals.
  late final Stream<OrgFreedesktopNetworkManagerCheckPermissions>
      checkPermissions;

  /// Stream of org.freedesktop.NetworkManager.StateChanged signals.
  late final Stream<OrgFreedesktopNetworkManagerStateChanged> stateChanged;

  /// Stream of org.freedesktop.NetworkManager.DeviceAdded signals.
  late final Stream<OrgFreedesktopNetworkManagerDeviceAdded> deviceAdded;

  /// Stream of org.freedesktop.NetworkManager.DeviceRemoved signals.
  late final Stream<OrgFreedesktopNetworkManagerDeviceRemoved> deviceRemoved;

  OrgFreedesktopNetworkManager(DBusClient client, String destination,
      {DBusObjectPath path =
          const DBusObjectPath.unchecked('/org/freedesktop/NetworkManager')})
      : super(client, name: destination, path: path) {
    checkPermissions = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.NetworkManager',
            name: 'CheckPermissions',
            signature: DBusSignature(''))
        .asBroadcastStream()
        .map((signal) => OrgFreedesktopNetworkManagerCheckPermissions(signal));

    stateChanged = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.NetworkManager',
            name: 'StateChanged',
            signature: DBusSignature('u'))
        .asBroadcastStream()
        .map((signal) => OrgFreedesktopNetworkManagerStateChanged(signal));

    deviceAdded = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.NetworkManager',
            name: 'DeviceAdded',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => OrgFreedesktopNetworkManagerDeviceAdded(signal));

    deviceRemoved = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.freedesktop.NetworkManager',
            name: 'DeviceRemoved',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => OrgFreedesktopNetworkManagerDeviceRemoved(signal));
  }

  /// Gets org.freedesktop.NetworkManager.Devices
  Future<List<DBusObjectPath>> getDevices() async {
    var value = await getProperty('org.freedesktop.NetworkManager', 'Devices',
        signature: DBusSignature('ao'));
    return value.asObjectPathArray().toList();
  }

  /// Gets org.freedesktop.NetworkManager.AllDevices
  Future<List<DBusObjectPath>> getAllDevices() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'AllDevices',
        signature: DBusSignature('ao'));
    return value.asObjectPathArray().toList();
  }

  /// Gets org.freedesktop.NetworkManager.Checkpoints
  Future<List<DBusObjectPath>> getCheckpoints() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'Checkpoints',
        signature: DBusSignature('ao'));
    return value.asObjectPathArray().toList();
  }

  /// Gets org.freedesktop.NetworkManager.NetworkingEnabled
  Future<bool> getNetworkingEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'NetworkingEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.NetworkManager.WirelessEnabled
  Future<bool> getWirelessEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'WirelessEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Sets org.freedesktop.NetworkManager.WirelessEnabled
  Future<void> setWirelessEnabled(bool value) async {
    await setProperty('org.freedesktop.NetworkManager', 'WirelessEnabled',
        DBusBoolean(value));
  }

  /// Gets org.freedesktop.NetworkManager.WirelessHardwareEnabled
  Future<bool> getWirelessHardwareEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'WirelessHardwareEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.NetworkManager.WwanEnabled
  Future<bool> getWwanEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'WwanEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Sets org.freedesktop.NetworkManager.WwanEnabled
  Future<void> setWwanEnabled(bool value) async {
    await setProperty(
        'org.freedesktop.NetworkManager', 'WwanEnabled', DBusBoolean(value));
  }

  /// Gets org.freedesktop.NetworkManager.WwanHardwareEnabled
  Future<bool> getWwanHardwareEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'WwanHardwareEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.NetworkManager.WimaxEnabled
  Future<bool> getWimaxEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'WimaxEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Sets org.freedesktop.NetworkManager.WimaxEnabled
  Future<void> setWimaxEnabled(bool value) async {
    await setProperty(
        'org.freedesktop.NetworkManager', 'WimaxEnabled', DBusBoolean(value));
  }

  /// Gets org.freedesktop.NetworkManager.WimaxHardwareEnabled
  Future<bool> getWimaxHardwareEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'WimaxHardwareEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.NetworkManager.RadioFlags
  Future<int> getRadioFlags() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'RadioFlags',
        signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.NetworkManager.ActiveConnections
  Future<List<DBusObjectPath>> getActiveConnections() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'ActiveConnections',
        signature: DBusSignature('ao'));
    return value.asObjectPathArray().toList();
  }

  /// Gets org.freedesktop.NetworkManager.PrimaryConnection
  Future<DBusObjectPath> getPrimaryConnection() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'PrimaryConnection',
        signature: DBusSignature('o'));
    return value.asObjectPath();
  }

  /// Gets org.freedesktop.NetworkManager.PrimaryConnectionType
  Future<String> getPrimaryConnectionType() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'PrimaryConnectionType',
        signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.NetworkManager.Metered
  Future<int> getMetered() async {
    var value = await getProperty('org.freedesktop.NetworkManager', 'Metered',
        signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.NetworkManager.ActivatingConnection
  Future<DBusObjectPath> getActivatingConnection() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'ActivatingConnection',
        signature: DBusSignature('o'));
    return value.asObjectPath();
  }

  /// Gets org.freedesktop.NetworkManager.Startup
  Future<bool> getStartup() async {
    var value = await getProperty('org.freedesktop.NetworkManager', 'Startup',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.NetworkManager.Version
  Future<String> getVersion() async {
    var value = await getProperty('org.freedesktop.NetworkManager', 'Version',
        signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.NetworkManager.VersionInfo
  Future<List<int>> getVersionInfo() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'VersionInfo',
        signature: DBusSignature('au'));
    return value.asUint32Array().toList();
  }

  /// Gets org.freedesktop.NetworkManager.Capabilities
  Future<List<int>> getCapabilities() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'Capabilities',
        signature: DBusSignature('au'));
    return value.asUint32Array().toList();
  }

  /// Gets org.freedesktop.NetworkManager.State
  Future<int> getState() async {
    var value = await getProperty('org.freedesktop.NetworkManager', 'State',
        signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.NetworkManager.Connectivity
  Future<int> getConnectivity() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'Connectivity',
        signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Gets org.freedesktop.NetworkManager.ConnectivityCheckAvailable
  Future<bool> getConnectivityCheckAvailable() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'ConnectivityCheckAvailable',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Gets org.freedesktop.NetworkManager.ConnectivityCheckEnabled
  Future<bool> getConnectivityCheckEnabled() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'ConnectivityCheckEnabled',
        signature: DBusSignature('b'));
    return value.asBoolean();
  }

  /// Sets org.freedesktop.NetworkManager.ConnectivityCheckEnabled
  Future<void> setConnectivityCheckEnabled(bool value) async {
    await setProperty('org.freedesktop.NetworkManager',
        'ConnectivityCheckEnabled', DBusBoolean(value));
  }

  /// Gets org.freedesktop.NetworkManager.ConnectivityCheckUri
  Future<String> getConnectivityCheckUri() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'ConnectivityCheckUri',
        signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.freedesktop.NetworkManager.GlobalDnsConfiguration
  Future<Map<String, DBusValue>> getGlobalDnsConfiguration() async {
    var value = await getProperty(
        'org.freedesktop.NetworkManager', 'GlobalDnsConfiguration',
        signature: DBusSignature('a{sv}'));
    return value.asStringVariantDict();
  }

  /// Sets org.freedesktop.NetworkManager.GlobalDnsConfiguration
  Future<void> setGlobalDnsConfiguration(Map<String, DBusValue> value) async {
    await setProperty('org.freedesktop.NetworkManager',
        'GlobalDnsConfiguration', DBusDict.stringVariant(value));
  }

  /// Invokes org.freedesktop.NetworkManager.Reload()
  Future<void> callReload(int flags,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.freedesktop.NetworkManager', 'Reload', [DBusUint32(flags)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.NetworkManager.GetDevices()
  Future<List<DBusObjectPath>> callGetDevices(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager', 'GetDevices', [],
        replySignature: DBusSignature('ao'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPathArray().toList();
  }

  /// Invokes org.freedesktop.NetworkManager.GetAllDevices()
  Future<List<DBusObjectPath>> callGetAllDevices(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager', 'GetAllDevices', [],
        replySignature: DBusSignature('ao'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPathArray().toList();
  }

  /// Invokes org.freedesktop.NetworkManager.GetDeviceByIpIface()
  Future<DBusObjectPath> callGetDeviceByIpIface(String iface,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.freedesktop.NetworkManager',
        'GetDeviceByIpIface', [DBusString(iface)],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }

  /// Invokes org.freedesktop.NetworkManager.ActivateConnection()
  Future<DBusObjectPath> callActivateConnection(DBusObjectPath connection,
      DBusObjectPath device, DBusObjectPath specificObject,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.freedesktop.NetworkManager',
        'ActivateConnection', [connection, device, specificObject],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }

  /// Invokes org.freedesktop.NetworkManager.AddAndActivateConnection()
  Future<List<DBusValue>> callAddAndActivateConnection(
      Map<String, Map<String, DBusValue>> connection,
      DBusObjectPath device,
      DBusObjectPath specificObject,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager',
        'AddAndActivateConnection',
        [
          DBusDict(
              DBusSignature('s'),
              DBusSignature('a{sv}'),
              connection.map((key, value) =>
                  MapEntry(DBusString(key), DBusDict.stringVariant(value)))),
          device,
          specificObject
        ],
        replySignature: DBusSignature('oo'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.NetworkManager.AddAndActivateConnection2()
  Future<List<DBusValue>> callAddAndActivateConnection2(
      Map<String, Map<String, DBusValue>> connection,
      DBusObjectPath device,
      DBusObjectPath specificObject,
      Map<String, DBusValue> options,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager',
        'AddAndActivateConnection2',
        [
          DBusDict(
              DBusSignature('s'),
              DBusSignature('a{sv}'),
              connection.map((key, value) =>
                  MapEntry(DBusString(key), DBusDict.stringVariant(value)))),
          device,
          specificObject,
          DBusDict.stringVariant(options)
        ],
        replySignature: DBusSignature('ooa{sv}'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.NetworkManager.DeactivateConnection()
  Future<void> callDeactivateConnection(DBusObjectPath activeConnection,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.NetworkManager', 'DeactivateConnection',
        [activeConnection],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.NetworkManager.Sleep()
  Future<void> callSleep(bool sleep,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.freedesktop.NetworkManager', 'Sleep', [DBusBoolean(sleep)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.NetworkManager.Enable()
  Future<void> callEnable(bool enable,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.freedesktop.NetworkManager', 'Enable', [DBusBoolean(enable)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.NetworkManager.GetPermissions()
  Future<Map<String, String>> callGetPermissions(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager', 'GetPermissions', [],
        replySignature: DBusSignature('a{ss}'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0]
        .asDict()
        .map((key, value) => MapEntry(key.asString(), value.asString()));
  }

  /// Invokes org.freedesktop.NetworkManager.SetLogging()
  Future<void> callSetLogging(String level, String domains,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.NetworkManager', 'SetLogging',
        [DBusString(level), DBusString(domains)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.NetworkManager.GetLogging()
  Future<List<DBusValue>> callGetLogging(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager', 'GetLogging', [],
        replySignature: DBusSignature('ss'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.freedesktop.NetworkManager.CheckConnectivity()
  Future<int> callCheckConnectivity(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager', 'CheckConnectivity', [],
        replySignature: DBusSignature('u'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asUint32();
  }

  /// Invokes org.freedesktop.NetworkManager.state()
  Future<int> callstate(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.freedesktop.NetworkManager', 'state', [],
        replySignature: DBusSignature('u'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asUint32();
  }

  /// Invokes org.freedesktop.NetworkManager.CheckpointCreate()
  Future<DBusObjectPath> callCheckpointCreate(
      List<DBusObjectPath> devices, int rollbackTimeout, int flags,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager',
        'CheckpointCreate',
        [
          DBusArray.objectPath(devices),
          DBusUint32(rollbackTimeout),
          DBusUint32(flags)
        ],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }

  /// Invokes org.freedesktop.NetworkManager.CheckpointDestroy()
  Future<void> callCheckpointDestroy(DBusObjectPath checkpoint,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.freedesktop.NetworkManager', 'CheckpointDestroy', [checkpoint],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.freedesktop.NetworkManager.CheckpointRollback()
  Future<Map<String, int>> callCheckpointRollback(DBusObjectPath checkpoint,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.NetworkManager', 'CheckpointRollback', [checkpoint],
        replySignature: DBusSignature('a{su}'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0]
        .asDict()
        .map((key, value) => MapEntry(key.asString(), value.asUint32()));
  }

  /// Invokes org.freedesktop.NetworkManager.CheckpointAdjustRollbackTimeout()
  Future<void> callCheckpointAdjustRollbackTimeout(
      DBusObjectPath checkpoint, int addTimeout,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.freedesktop.NetworkManager',
        'CheckpointAdjustRollbackTimeout', [checkpoint, DBusUint32(addTimeout)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
