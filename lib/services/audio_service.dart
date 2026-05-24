import 'package:just_audio/just_audio.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playMemeAudio(String assetPath) async {
    try {
      await _player.setAsset(assetPath);
      await _player.play();
    } catch (e) {
      print("Erro ao tocar áudio: $e");
    }
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
