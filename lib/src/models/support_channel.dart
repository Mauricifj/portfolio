import '../utils/json_utils.dart';
import 'support_channel_type.dart';

class SupportChannel {
  final SupportChannelType type;
  final String title;
  final String subtitle;
  final String url;

  SupportChannel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.url,
  });

  factory SupportChannel.fromJson(
    Map<String, dynamic> json,
    String languageCode,
  ) {
    return SupportChannel(
      type: .fromJson(json['type'] as String),
      title: getLocalized(json['title'], languageCode),
      subtitle: json['subtitle'] as String,
      url: json['url'] as String,
    );
  }
}
