Map<String, String> convertMapToString(
    {required Map<String, dynamic> originalMap}) {
  return originalMap.map((key, value) => MapEntry(key, value.toString()));
}
