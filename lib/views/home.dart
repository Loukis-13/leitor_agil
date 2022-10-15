import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:leitor_agil/providers/settings.dart';

class Home extends StatelessWidget {
  const Home(this.settings, {Key? key}) : super(key: key);
  final Settings settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: "Configurações",
          onPressed: () => Navigator.pushNamed(context, "configurations"),
        ),
      ]),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              initialDirectory: '~',
              type: FileType.custom,
              allowedExtensions: ['txt', 'pdf', 'doc'],
              withData: true,
            );
            if (result == null) return;
            settings.setWords(result.files.first);
            Navigator.pushNamed(context, 'display');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(settings.primary),
            foregroundColor: MaterialStateProperty.all<Color>(settings.secondary),
            fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
          ),
          child: const Text("Escolher arquivo"),
        ),
      ),
    );
  }
}
