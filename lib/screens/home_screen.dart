import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/meme_service.dart';
import '../services/permission_service.dart';
import '../widgets/meme_card.dart';
import '../data/meme_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Todos';

  @override
  Widget build(BuildContext context) {
    final memeService = Provider.of<MemeService>(context);
    final categories = ['Todos', ...MemeDatabase.getCategories()];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MEMEGHOST',
          style: TextStyle(
            fontWeight: FontWeight.black,
            letterSpacing: 2,
            color: Color(0xFF9D00FF),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Navegar para configurações
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Seletor de Categorias
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                        memeService.filterByCategory(category);
                      });
                    },
                    selectedColor: const Color(0xFF9D00FF),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.white60,
                    ),
                  ),
                );
              },
            ),
          ),

          // Botões de Ação Rápida
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      bool granted = await PermissionService.requestOverlayPermission();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(granted ? "Permissão Concedida!" : "Permissão Negada!")),
                      );
                    },
                    icon: const Icon(Icons.security),
                    label: const Text("Ativar Permissões"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A1A),
                      foregroundColor: const Color(0xFF00F2FF),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Testar overlay com o primeiro meme
                      if (memeService.memes.isNotEmpty) {
                        memeService.triggerMeme(memeService.memes.first);
                      }
                    },
                    icon: const Icon(Icons.play_circle_outline),
                    label: const Text("Testar Overlay"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A1A),
                      foregroundColor: const Color(0xFF9D00FF),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Grid de Memes
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: memeService.memes.length,
              itemBuilder: (context, index) {
                final meme = memeService.memes[index];
                return MemeCard(
                  meme: meme,
                  onTap: () => memeService.triggerMeme(meme),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: memeService.isOverlayActive
          ? FloatingActionButton(
              onPressed: () => memeService.triggerMeme(memeService.memes.first),
              backgroundColor: Colors.red,
              child: const Icon(Icons.stop),
            )
          : null,
    );
  }
}
