class ConfigProvider {
  late final String wifiDoubleClick;
  late final String bluetoothDoubleClick;
  late final String startIconClick;
  late final String backgroundColor;

  ConfigProvider(
      {required this.wifiDoubleClick,
      required this.bluetoothDoubleClick,
      required String backgroundColorHex,
      required this.startIconClick}) {
    backgroundColor = backgroundColorHex.replaceAll("#", "0xFF");
  }
}
