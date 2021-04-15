  String getBackError(String value, String name, String regex, String error) {
    if (value == null || value == '') {
      return '* $name is required';
    } else if (RegExp(regex).hasMatch(value) == false) {
      return error;
    } else
      return null;
  }

  String getConfirmPass(
      String value, String name, String password, String error) {
    if (value == null || value == '') {
      return '* $name is required';
    } else if (value != password) {
      return error;
    } else
      return null;
  }