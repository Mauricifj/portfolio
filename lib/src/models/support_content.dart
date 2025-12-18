import 'support_channel.dart';

class SupportContent {
  final List<SupportChannel> channels;

  SupportContent({required this.channels});

  factory SupportContent.fromJson(
    Map<String, dynamic> json,
    String languageCode,
  ) {
    return SupportContent(
      channels: (json['channels'] as List)
          .map((e) => SupportChannel.fromJson(e, languageCode))
          .toList(),
    );
  }
}
