import 'dart:async';
import 'package:bar/dbus/network_dbus.dart';
import 'package:bar/dbus/upower_dbus.dart';
import 'package:bar/models/battery_model.dart';
import 'package:bar/models/network_model.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/cupertino.dart';

enum NetworkMetered {
  METERED_UNKNOWN(0),
  METERED_YES(1),
  METERED_NO(2),
  METERED_GUESS_YES(3),
  METERED_GUESS_NO(4);

  const NetworkMetered(this.value);
  final int value;

  static NetworkMetered fromValue(int value) {
    switch (value) {
      case 0:
        return NetworkMetered.METERED_UNKNOWN;
      case 1:
        return NetworkMetered.METERED_YES;
      case 2:
        return NetworkMetered.METERED_NO;
      case 3:
        return NetworkMetered.METERED_GUESS_YES;
      case 4:
        return NetworkMetered.METERED_GUESS_NO;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}

enum NS {
  STATE_UNKNOWN(10),
  STATE_ASLEEP(20),
  STATE_DISCONNECTED(30),
  STATE_DISCONNECTING(40),
  STATE_CONNECTING(50),
  STATE_CONNECTED_LOCAL(60),
  STATE_CONNECTED_SITE(70),
  STATE_CONNECTED_GLOBAL(80);

  const NS(this.value);
  final int value;

  static NS fromValue(int value) {
    switch (value) {
      case 10:
        return NS.STATE_UNKNOWN;
      case 20:
        return NS.STATE_ASLEEP;
      case 30:
        return NS.STATE_DISCONNECTED;
      case 40:
        return NS.STATE_DISCONNECTING;
      case 50:
        return NS.STATE_CONNECTING;
      case 60:
        return NS.STATE_CONNECTED_LOCAL;
      case 70:
        return NS.STATE_CONNECTED_SITE;
      case 80:
        return NS.STATE_CONNECTED_GLOBAL;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}

enum Connectivity {
  UNKNOWN(1),
  NONE(2),
  PORTAL(3),
  LIMITED(4),
  FULL(5);

  const Connectivity(this.value);
  final int value;

  static Connectivity fromValue(int value) {
    switch (value) {
      case 1:
        return Connectivity.UNKNOWN;
      case 2:
        return Connectivity.NONE;
      case 3:
        return Connectivity.PORTAL;
      case 4:
        return Connectivity.LIMITED;
      case 5:
        return Connectivity.FULL;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}

class NetworkStream {
  late final DBusClient _client;
  late final OrgFreedesktopNetworkManager _object;

  final StreamController<NetworkInfo> eventListener =
      StreamController<NetworkInfo>();

  NetworkStream() {
    _client = DBusClient.system();
    _object = OrgFreedesktopNetworkManager(
        _client, "org.freedesktop.NetworkManager",
        path: DBusObjectPath('/org/freedesktop/NetworkManager'));

    _startStream();
  }

  Future<Map<String, dynamic>> getWifiInfo(
      DBusRemoteObject accessPointObject) async {
    final ssidBytes = await accessPointObject.getProperty(
        'org.freedesktop.NetworkManager.AccessPoint', 'Ssid');
    final ssid = String.fromCharCodes(
        (ssidBytes as DBusArray).children.map((e) => (e as DBusByte).value));
    final strength = await accessPointObject.getProperty(
        'org.freedesktop.NetworkManager.AccessPoint', 'Strength');
    final frequency = await accessPointObject.getProperty(
        'org.freedesktop.NetworkManager.AccessPoint', 'Frequency');

    return {
      'ssid': ssid,
      'strength': strength.asByte(),
      'frequency': frequency.asUint32()
    };
  }

  Future<String> getIpAddress(DBusRemoteObject accessPointObject) async {
    var ip4ConfigPath = await accessPointObject.getProperty(
      'org.freedesktop.NetworkManager.Connection.Active',
      'Ip4Config',
    );

    // Create a DBusRemoteObject for the Ip4Config
    var ip4ConfigObject = DBusRemoteObject(
      _client,
      name: 'org.freedesktop.NetworkManager',
      path: ip4ConfigPath.asObjectPath(),
    );

    // Get the 'AddressData' property of the Ip4Config
    var addressData = await ip4ConfigObject.getProperty(
      'org.freedesktop.NetworkManager.IP4Config',
      'AddressData',
    );

    final DBusValue firstAddressData = addressData.asArray()[0];
    final String ipAddr = firstAddressData
        .asDict()[const DBusString('address')]!
        .asVariant()
        .asString();

    return ipAddr;
  }

  Future<NetworkInfo> getNetworkInfo() async {
    Map<String, DBusValue> allProps =
        await _object.getAllProperties("org.freedesktop.NetworkManager");

    bool primatyConnectionIsWifi =
        allProps['PrimaryConnectionType']!.asString().contains("wireless")
            ? true
            : false;
    bool wifiOn = allProps['WirelessEnabled']!.asBoolean();
    int metered = allProps['Metered']!.asUint32();
    int connectivity = allProps['Connectivity']!.asUint32();

    NS state = NS.fromValue(allProps['State']!.asUint32());
    print(state.toString());

    DBusObjectPath primaryConnectionPath =
        allProps['PrimaryConnection']!.asObjectPath();

    if (state == NS.STATE_CONNECTED_GLOBAL ||
        state == NS.STATE_CONNECTED_SITE) {
      final activeConnectionObject = DBusRemoteObject(_client,
          name: "org.freedesktop.NetworkManager", path: primaryConnectionPath);
      final specificObjectPath = await activeConnectionObject.getProperty(
          'org.freedesktop.NetworkManager.Connection.Active', 'SpecificObject');
      final accessPointObject = DBusRemoteObject(_client,
          name: 'org.freedesktop.NetworkManager',
          path: specificObjectPath.asObjectPath());

      final String ip = await getIpAddress(activeConnectionObject);

      if (primatyConnectionIsWifi) {
        final Map<String, dynamic> wifiInfo =
            await getWifiInfo(accessPointObject);

        return NetworkInfo(
          wifiSsid: wifiInfo['ssid'],
          wifiStrength: wifiInfo['strength'],
          wifiFrequency: wifiInfo['frequency'],
          ip: ip,
          primaryConnectionIsWifi: primatyConnectionIsWifi,
          state: state,
          connectivity: Connectivity.fromValue(connectivity),
          networkMetered: NetworkMetered.fromValue(metered),
        );
      } else {
        return NetworkInfo(
          ip: ip,
          state: state,
          primaryConnectionIsWifi: primatyConnectionIsWifi,
          connectivity: Connectivity.fromValue(connectivity),
          networkMetered: NetworkMetered.fromValue(metered),
        );
      }
    } else {
      return NetworkInfo(
        state: state,
        primaryConnectionIsWifi: primatyConnectionIsWifi,
        connectivity: Connectivity.fromValue(connectivity),
        networkMetered: NetworkMetered.fromValue(metered),
      );
    }
  }

  void _startStream() {
    _object.propertiesChanged.listen((signal) async {
      Set<String> keysToMonitor = {
        "Connectivity",
        "State",
        // "ActivatingConnection",
        "WirelessEnabled",
        "PrimaryConnection"
      };

      if (signal.changedProperties.keys
          .toSet()
          .intersection(keysToMonitor)
          .isNotEmpty) {
        eventListener.sink.add(await getNetworkInfo());
      }
    });
  }
}
