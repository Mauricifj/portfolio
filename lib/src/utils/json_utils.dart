String getLocalized(Map<String, dynamic> map, String languageCode) {
  if (map.containsKey(languageCode)) {
    return map[languageCode];
  }
  return map['en'] ?? '';
}
