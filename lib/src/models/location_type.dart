enum LocationType {
  remote,
  onsite,
  hybrid,
  unspecified;

  static LocationType fromJson(String? value) {
    return values.firstWhere((e) => e.name == value, orElse: () => unspecified);
  }

  bool get isVisible => this != unspecified;

  String get label {
    switch (this) {
      case remote:
        return 'Remote';
      case hybrid:
        return 'Hybrid';
      case onsite:
        return 'On-site';
      case unspecified:
        return '';
    }
  }
}
