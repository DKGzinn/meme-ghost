import '../models/meme_model.dart';

class MemeDatabase {
  static List<MemeModel> getMemes() {
    return [
      MemeModel(
        id: '1',
        name: 'Troll Face',
        category: 'Troll',
        thumbnailUrl: 'assets/memes/troll_thumb.png',
        mediaUrl: 'assets/gifs/troll.gif',
        audioUrl: 'assets/audio/troll_laugh.mp3',
        duration: const Duration(seconds: 5),
        type: MemeType.gif,
      ),
      MemeModel(
        id: '2',
        name: 'Risada Maléfica',
        category: 'Risadas',
        thumbnailUrl: 'assets/memes/evil_laugh_thumb.png',
        mediaUrl: 'assets/gifs/evil_laugh.gif',
        audioUrl: 'assets/audio/evil_laugh.mp3',
        duration: const Duration(seconds: 4),
        type: MemeType.gif,
      ),
      MemeModel(
        id: '3',
        name: 'Gemidão do Zap',
        category: 'Gemidão',
        thumbnailUrl: 'assets/memes/gemidao_thumb.png',
        mediaUrl: 'assets/gifs/ghost_transparent.gif',
        audioUrl: 'assets/audio/gemidao.mp3',
        duration: const Duration(seconds: 6),
        type: MemeType.gif,
      ),
      MemeModel(
        id: '4',
        name: 'Susto do Grito',
        category: 'Assustadores',
        thumbnailUrl: 'assets/memes/scary_thumb.png',
        mediaUrl: 'assets/gifs/scary_jump.gif',
        audioUrl: 'assets/audio/scream.mp3',
        duration: const Duration(seconds: 3),
        type: MemeType.gif,
      ),
      MemeModel(
        id: '5',
        name: 'Meme BR Clássico',
        category: 'Memes BR',
        thumbnailUrl: 'assets/memes/br_thumb.png',
        mediaUrl: 'assets/gifs/dance.gif',
        audioUrl: 'assets/audio/br_song.mp3',
        duration: const Duration(seconds: 8),
        type: MemeType.gif,
      ),
    ];
  }

  static List<String> getCategories() {
    return [
      'Troll',
      'Sons altos',
      'Gemidão',
      'Memes BR',
      'Risadas',
      'Assustadores',
    ];
  }
}
