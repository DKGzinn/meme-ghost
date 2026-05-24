import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/meme_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MemeService()),
      ],
      child: const MemeGhostApp(),
    ),
  );
}

@pragma("vm:entry-point")
void overlayMain() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OverlayContent(),
  ));
}

class MemeGhostApp extends StatelessWidget {
  const MemeGhostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemeGhost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF9D00FF), // Roxo Neon
        scaffoldBackgroundColor: const Color(0xFF0A0A0A), // Preto Profundo
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF9D00FF),
          secondary: Color(0xFF00F2FF), // Ciano Neon
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class OverlayContent extends StatelessWidget {
  const OverlayContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "👻",
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
