  String getBackError(String value, String name, String regex, String error) {
    if (value == '') {
      return '* $name is required';
    } else if (RegExp(regex).hasMatch(value) == false) {
      return error;
    } else
      return '';
  }

  String getConfirmPass(
      String value, String name, String password, String error) {
    if ( value == '') {
      return '* $name is required';
    } else if (value != password) {
      return error;
    } else
      return '';
  }

  extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}
