import 'package:coletorestoque/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:coletorestoque/screens/login_screen.dart';

void main() {
  runApp(const KinitosFestasApp());
}

class KinitosFestasApp extends StatelessWidget {
  const KinitosFestasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kinitos Festas',
      home: LoginScreen(),
    );
  }
}
