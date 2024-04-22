String? validateMobile(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Mobile Number';
  } else if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Please enter a valid 10-digit Mobile Number';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Email';
  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
    return 'Please enter a valid Email';
  }
  return null;
}