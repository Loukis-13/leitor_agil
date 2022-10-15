import 'package:flutter/material.dart';
import 'package:leitor_agil/providers/settings.dart';

class Display extends StatefulWidget {
  const Display(this.settings, {Key? key}) : super(key: key);
  final Settings settings;

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    final settings = widget.settings;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                widget.settings.word,
                style: TextStyle(
                  fontSize: settings.fontSize,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.fast_rewind),
                tooltip: "Avançar",
                onPressed: () => settings.fastRewind(),
                color: settings.primary,
                iconSize: 60,
              ),
              if (settings.counter != 0)
                IconButton(
                  icon: const Icon(Icons.restart_alt),
                  tooltip: "Reiniciar",
                  onPressed: () => settings.restart(),
                  color: settings.primary,
                  iconSize: 60,
                ),
              IconButton(
                icon: Icon(settings.isPlaying ? Icons.pause : Icons.play_arrow),
                tooltip: "Iniciar",
                onPressed: () => settings.isPlaying ? settings.stop() : settings.start(),
                color: settings.primary,
                iconSize: 60,
              ),
              IconButton(
                icon: const Icon(Icons.fast_forward),
                tooltip: "Avançar",
                onPressed: () => settings.fastForward(),
                color: settings.primary,
                iconSize: 60,
              ),
            ],
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
