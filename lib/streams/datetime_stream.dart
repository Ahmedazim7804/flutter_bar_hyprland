class DateTimeStream {
  DateTimeStream();

  Stream<DateTime> get eventListener =>
      Stream.periodic(const Duration(seconds: 1), (int _) {
        return DateTime.now();
      });
}
