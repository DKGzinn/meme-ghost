import 'package:flutter/foundation.dart';
import '../models/meme_model.dart';
import '../data/meme_database.dart';
import 'audio_service.dart';
import 'overlay_service.dart';

class MemeService extends ChangeNotifier {
  final AudioService _audioService = AudioService();
  List<MemeModel> _memes = MemeDatabase.getMemes();
  bool _isOverlayActive = false;

  List<MemeModel> get memes => _memes;
  bool get isOverlayActive => _isOverlayActive;

  void filterByCategory(String category) {
    if (category == 'Todos') {
      _memes = MemeDatabase.getMemes();
    } else {
      _memes = MemeDatabase.getMemes()
          .where((m) => m.category == category)
          .toList();
    }
    notifyListeners();
  }

  Future<void> triggerMeme(MemeModel meme) async {
    _isOverlayActive = true;
    notifyListeners();

    // Tocar áudio
    await _audioService.playMemeAudio(meme.audioUrl);
    
    // Mostrar Overlay
    await OverlayService.showMemeOverlay(meme);

    Future.delayed(meme.duration, () {
      _isOverlayActive = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }
}
