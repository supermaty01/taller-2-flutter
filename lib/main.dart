import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/info_screen.dart';
import 'screens/config_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller Flutter',
      // Definimos las rutas
      routes: {
        '/': (context) => const HomeScreen(),
        '/info': (context) => const InfoScreen(),
        '/config': (context) => const ConfigScreen(),
      },
      initialRoute: '/', // La primera pantalla que se abrirá
    );
  }
}
