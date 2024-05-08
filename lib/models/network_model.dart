import 'package:bar/streams/network_stream.dart';

class NetworkInfo {
  NetworkInfo(
      {required this.connectivity,
      required this.state,
      required this.networkMetered,
      required this.primaryConnectionIsWifi,
      this.wifiFrequency,
      this.wifiSsid,
      this.ip = "",
      this.wifiStrength});

  final Connectivity connectivity;
  final NS state;
  final bool primaryConnectionIsWifi;
  final NetworkMetered networkMetered;
  final int? wifiFrequency;
  final String? wifiSsid;
  final int? wifiStrength;
  final String ip;
}
