import 'package:flutter/material.dart';

class MyInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final int age;

  const MyInfoWidget({
    super.key,
    required this.name,
    required this.email,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Nombre: $name', style: const TextStyle(fontSize: 18)),
        Text('Correo: $email', style: const TextStyle(fontSize: 18)),
        Text('Edad: $age', style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
