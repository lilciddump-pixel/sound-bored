import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      body: const XylophonePage(),
    ),
  ));
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  AudioPlayer? _player; // single instance for all buttons

  void playSound(String fileName) async {
    // Stop previous sound if any
    if (_player != null) {
      await _player!.stop();
    }

    _player = AudioPlayer();
    await _player!.play(AssetSource('sounds/$fileName'));
  }

  Widget buildKey({required List<Color> colors, required String soundFile}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          playSound(soundFile);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 8,
                offset: const Offset(4, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'SOUND BORED',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 3,
              childAspectRatio: 1,
              children: [
                buildKey(colors: [Colors.red, Colors.deepOrange], soundFile: "67.mp3"),
                buildKey(colors: [Colors.orange, Colors.amber], soundFile: "dun.mp3"),
                buildKey(colors: [Colors.yellow, Colors.orange], soundFile: "emo.mp3"),
                buildKey(colors: [Colors.green, Colors.teal], soundFile: "galaxy.mp3"),
                buildKey(colors: [Colors.teal, Colors.cyan], soundFile: "jett.mp3"),
                buildKey(colors: [Colors.blue, Colors.indigo], soundFile: "low-cortisol-song.mp3"),
                buildKey(colors: [Colors.purple, Colors.deepPurple], soundFile: "malunggay-pandesal-remix.mp3"),
                buildKey(colors: [Colors.pink, Colors.redAccent], soundFile: "malunggay-pandesal.mp3"),
                buildKey(colors: [Colors.indigo, Colors.blue], soundFile: "meme-de-creditos-finales.mp3"),
                buildKey(colors: [Colors.cyan, Colors.blueAccent], soundFile: "nasa-bisaya.mp3"),
                buildKey(colors: [Colors.lime, Colors.greenAccent], soundFile: "oskar.mp3"),
                buildKey(colors: [Colors.brown, Colors.deepOrange], soundFile: "sabi-mo-hanggang-dulo-tayo.mp3"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}