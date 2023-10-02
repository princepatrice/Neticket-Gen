bool isValidUrl(String input) {
  // Regular expression to match a valid URL
  RegExp urlRegExp = RegExp(
    r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
    caseSensitive: false,
    multiLine: false,
  );

  return urlRegExp.hasMatch(input);
}

bool isValidText(String input) {
  // Regular expression to match a valid URL
  return input.isNotEmpty;
}