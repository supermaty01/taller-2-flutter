import 'package:flutter/material.dart';
import '../widgets/my_info_widget.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información Personal'),
      ),
      body: const Center(
        child: MyInfoWidget(
          name: 'Mateo',
          email: 'malvarezle@unal.edu.co',
          age: 22,
        ),
      ),
    );
  }
}
