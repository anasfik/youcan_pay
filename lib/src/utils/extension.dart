extension StatusCodeExtension on int {
  bool get isOk => this >= 200 && this < 300;
}
