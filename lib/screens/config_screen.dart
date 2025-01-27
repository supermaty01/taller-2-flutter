import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final List<String> _availableImages = [
    'assets/MSI_MAG.jpg',
    'assets/MSI_MEG_ACE.jpg',
    'assets/MSI_MEG_GODLIKE.jpg',
    'assets/MSI_MPG.jpg',
    'assets/MSI.png',
  ];

  String _selectedImage = 'assets/MSI_MPG.jpg';

  @override
  void initState() {
    super.initState();
    _loadCurrentSelection();
  }

  Future<void> _loadCurrentSelection() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getString('backgroundImage') ?? _selectedImage;

    if (!mounted) return;

    setState(() {
      _selectedImage = savedImage;
    });
  }

  Future<void> _saveSelection() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImage', _selectedImage);

    if (!mounted) return;

    Navigator.pop(context, _selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Fondo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Selecciona una imagen de fondo:'),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedImage,
              items: _availableImages.map((String path) {
                return DropdownMenuItem<String>(
                  value: path,
                  child: Text(path),
                );
              }).toList(),
              onChanged: (String? newPath) {
                if (newPath != null) {
                  setState(() {
                    _selectedImage = newPath;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSelection,
              child: const Text('Guardar y volver'),
            ),
          ],
        ),
      ),
    );
  }
}
