import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:leitor_agil/providers/settings.dart';

class Configurations extends StatelessWidget {
  const Configurations(this.settings, {Key? key}) : super(key: key);
  final Settings settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: settings.primary,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: SpinBox(
              value: settings.speed.toDouble(),
              min: 1,
              max: 1000,
              onChanged: (value) => settings.speed = value.toInt(),
              decoration: InputDecoration(
                labelText: 'Palavras por minuto',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: settings.secondary,
                  fontSize: 20,
                ),
              ),
              iconColor: MaterialStateProperty.all(settings.secondary),
              textStyle: TextStyle(color: settings.secondary),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: settings.primary,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: SpinBox(
              value: settings.fontSize.toDouble(),
              min: 1,
              max: 1000,
              onChanged: (value) => settings.fontSize = value,
              decoration: InputDecoration(
                labelText: 'Tamanho da fonte',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: settings.secondary,
                  fontSize: 20,
                ),
              ),
              iconColor: MaterialStateProperty.all(settings.secondary),
              textStyle: TextStyle(color: settings.secondary),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => showDialog(
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Primária"),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: settings.primary,
                              onColorChanged: (value) => settings.primary = value,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Sair'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        );
                      },
                      context: context,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(settings.primary),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Center(child: Text("Primária", style: TextStyle(color: settings.secondary))),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => showDialog(
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Secundária"),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: settings.secondary,
                              onColorChanged: (value) => settings.secondary = value,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Sair'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        );
                      },
                      context: context,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: settings.secondary,
                      side: BorderSide(width: 3, color: settings.primary),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Center(child: Text("Secundária", style: TextStyle(color: settings.primary))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
