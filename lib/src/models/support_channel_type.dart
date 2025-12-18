enum SupportChannelType {
  email,
  linkedin,
  unknown;

  static SupportChannelType fromJson(String value) {
    return values.firstWhere((e) => e.name == value, orElse: () => .unknown);
  }
}
