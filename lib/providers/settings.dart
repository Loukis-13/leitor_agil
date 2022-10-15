import 'dart:convert';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class Settings with ChangeNotifier {
  Color _primary = Colors.white;
  Color _secondary = Colors.black;
  double fontSize = 30;
  int speed = 200;

  List<String> _words = [];
  String _word = "";
  int _i = 0;
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;
  String get word => _word;
  int get counter => _i;
  Color get primary => _primary;
  Color get secondary => _secondary;

  set primary(Color color) {
    _primary = color;
    notifyListeners();
  }

  set secondary(Color color) {
    _secondary = color;
    notifyListeners();
  }

  void setWords(PlatformFile file) {
    _isPlaying = false;
    _i = 0;

    switch (file.extension) {
      case "txt":
        _words = utf8.decode(file.bytes!).split(RegExp("\\s"));
        break;
      case "pdf":
        _words = PdfTextExtractor(PdfDocument(inputBytes: file.bytes)).extractText().trim().split(RegExp("\\s"));
        break;
      default:
    }

    _word = _words[_i];
    notifyListeners();
  }

  void start() {
    _isPlaying = true;
    notifyListeners();
    play();
  }

  void stop() {
    _isPlaying = false;
    notifyListeners();
  }

  void restart() {
    _isPlaying = false;
    _i = 0;
    _word = _words[_i];
    notifyListeners();
  }

  void play() {
    if (_i == _words.length) {
      _isPlaying = false;
      notifyListeners();
      return;
    }

    _word = _words[_i++];
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1000 ~/ (speed ~/ 60)), () => _isPlaying ? play() : null);
  }

  void fastForward() {
    _i = min(_i + 5, _words.length);
    _word = _words[_i];
    notifyListeners();
  }

  void fastRewind() {
    _i = max(_i - 5, 0);
    _word = _words[_i];
    notifyListeners();
  }
}
