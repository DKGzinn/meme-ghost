enum MemeType { gif, video }

class MemeModel {
  final String id;
  final String name;
  final String category;
  final String thumbnailUrl;
  final String mediaUrl;
  final String audioUrl;
  final Duration duration;
  final MemeType type;

  MemeModel({
    required this.id,
    required this.name,
    required this.category,
    required this.thumbnailUrl,
    required this.mediaUrl,
    required this.audioUrl,
    required this.duration,
    required this.type,
  });
}
