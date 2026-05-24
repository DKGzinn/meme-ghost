# MemeGhost 👻

MemeGhost é um aplicativo Android desenvolvido com Flutter e Kotlin que permite "assombrar" outros aplicativos com memes flutuantes (overlays).

## 🚀 Funcionalidades

- **Overlay Transparente:** Exibe GIFs e vídeos sobre qualquer aplicativo (WhatsApp, Instagram, etc).
- **Áudio Sincronizado:** Toca o som do meme simultaneamente à exibição visual.
- **Categorias de Memes:** Organização por Troll, Sons Altos, Gemidão, Memes BR, etc.
- **Design Gamer:** Interface moderna com tema dark, roxo neon e efeitos de glow.
- **Fechamento Automático:** O overlay desaparece sozinho após a duração do meme.

## 🛠️ Tecnologias

- **Flutter:** Interface e lógica multiplataforma.
- **Kotlin:** Serviços nativos Android para gerenciamento de janelas de alerta do sistema.
- **Plugins:** `flutter_overlay_window`, `just_audio`, `video_player`, `gif_view`, `permission_handler`.

## 📦 Como Executar

### Pré-requisitos

- Flutter SDK 3.10.0 ou superior instalado.
- Visual Studio Code com as extensões **Flutter** e **Dart** instaladas.
- Um dispositivo Android real ou emulador (Android 10+ recomendado).
- Android SDK com suporte a Android 21+.

### Instalação e Execução

1. **Extraia o projeto** e abra a pasta `meme_ghost` no VS Code.

2. **Obtenha as dependências:**
   ```bash
   flutter pub get
   ```

3. **Se encontrar erros de compatibilidade, execute:**
   ```bash
   flutter clean
   flutter pub upgrade --major-versions
   ```

4. **Conecte um dispositivo Android ou inicie um emulador.**

5. **Execute o aplicativo:**
   ```bash
   flutter run
   ```
   
   Alternativamente, no VS Code, pressione **F5** para iniciar a depuração.

### Configuração de Assets

- Adicione seus arquivos de mídia nas pastas correspondentes em `assets/`.
- Certifique-se de que os nomes coincidem com os definidos em `lib/data/meme_database.dart`.

## ⚠️ Importante

Este aplicativo requer a permissão **"Exibir sobre outros aplicativos"** (System Alert Window) para funcionar corretamente. O app guiará você para as configurações do sistema ao clicar em "Ativar Permissões".

## 📁 Estrutura do Projeto

```
meme_ghost/
├── lib/
│   ├── main.dart                 # Ponto de entrada
│   ├── screens/
│   │   ├── home_screen.dart      # Tela principal
│   │   ├── meme_category_screen.dart
│   │   ├── settings_screen.dart
│   │   └── overlay_test_screen.dart
│   ├── widgets/
│   │   ├── meme_card.dart        # Card de meme
│   │   ├── category_button.dart
│   │   └── overlay_preview.dart
│   ├── services/
│   │   ├── audio_service.dart    # Reprodução de áudio
│   │   ├── overlay_service.dart  # Gerenciamento de overlay
│   │   ├── meme_service.dart     # Lógica de memes
│   │   └── permission_service.dart # Permissões
│   ├── models/
│   │   └── meme_model.dart       # Modelo de dados
│   ├── data/
│   │   └── meme_database.dart    # Banco de dados local
│   └── utils/
│       ├── constants.dart
│       └── animations.dart
├── android/
│   ├── app/
│   │   ├── src/main/kotlin/com/example/meme_ghost/
│   │   │   ├── MainActivity.kt
│   │   │   └── OverlayService.kt
│   │   ├── src/main/AndroidManifest.xml
│   │   └── build.gradle
│   ├── build.gradle
│   └── settings.gradle
├── assets/
│   ├── memes/
│   ├── audio/
│   └── gifs/
├── pubspec.yaml                  # Dependências
└── README.md
```

## 🔧 Troubleshooting

**Erro: "Failed to update pack"**
- Execute `flutter clean` e depois `flutter pub get` novamente.
- Se persistir, tente `flutter pub upgrade --major-versions`.

**Permissão de overlay não funciona**
- Verifique se o dispositivo está rodando Android 10+.
- Vá em Configurações > Aplicativos > MemeGhost > Permissões > Exibir sobre outros aplicativos.

**Overlay não aparece**
- Certifique-se de que o `flutter_overlay_window` foi instalado corretamente.
- Reinicie o aplicativo e o dispositivo.

## 📝 Notas

Desenvolvido para fins de entretenimento. Use com responsabilidade!

## 📄 Licença

MIT License

---

**Desenvolvido com ❤️ usando Flutter e Kotlin**
