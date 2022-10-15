import 'package:flutter/material.dart';
import 'package:leitor_agil/providers/settings.dart';
import 'package:leitor_agil/views/configurations.dart';
import 'package:leitor_agil/views/display.dart';
import 'package:leitor_agil/views/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Settings())],
        child: const LeitorAgil(),
      ),
    );

class LeitorAgil extends StatelessWidget {
  const LeitorAgil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: value.secondary,
          backgroundColor: value.secondary,
          scaffoldBackgroundColor: value.secondary,
          appBarTheme: AppBarTheme(
            backgroundColor: value.secondary,
            iconTheme: IconThemeData(color: value.primary),
            elevation: 0,
          ),
          textTheme: Theme.of(context).textTheme.apply(bodyColor: value.primary, displayColor: value.primary),
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => Home(value),
          'configurations': (context) => Configurations(value),
          'display': (context) => Display(value),
        },
      ),
    );
  }
}
