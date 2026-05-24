import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import '../models/meme_model.dart';
import 'dart:async';

class OverlayService {
  static Future<void> showMemeOverlay(MemeModel meme) async {
    if (await FlutterOverlayWindow.isActive()) {
      await FlutterOverlayWindow.closeOverlay();
    }

    await FlutterOverlayWindow.showOverlay(
      enableDrag: false,
      overlayTitle: "MemeGhost",
      overlayContent: "Exibindo ${meme.name}",
      flag: OverlayFlag.clickThrough,
      visibility: NotificationVisibility.visibilityPublic,
      positionGravity: PositionGravity.center,
      height: WindowSize.matchParent,
      width: WindowSize.matchParent,
    );

    // Enviar dados do meme para o overlay via MethodChannel ou similar se necessário
    // Aqui simulamos o fechamento automático
    Timer(meme.duration, () async {
      await FlutterOverlayWindow.closeOverlay();
    });
  }

  static Future<void> closeOverlay() async {
    await FlutterOverlayWindow.closeOverlay();
  }
}
