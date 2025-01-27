import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _backgroundImage = 'assets/MSI_MPG.jpg';

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  Future<void> _loadBackgroundImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('backgroundImage') ?? _backgroundImage;
    setState(() {
      _backgroundImage = imagePath;
    });
  }

  Future<void> _goToConfigScreen() async {
    final updatedImage = await Navigator.pushNamed(context, '/config');

    if (updatedImage is String && updatedImage.isNotEmpty) {
      setState(() {
        _backgroundImage = updatedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              _backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: _goToConfigScreen,
                  child: const Text('Configurar fondo'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/info'),
                  child: const Text('Ver mi información'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
