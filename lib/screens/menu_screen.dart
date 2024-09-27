import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'home_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kinitos Festas'),
        centerTitle: true,
        backgroundColor: Constants.appBarBackground,
        foregroundColor: Constants.appBarForeground,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 64.0),
        color: Constants.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Image.asset(Constants.logo, height: 250),
            const SizedBox(height: 30),
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Constants.details,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Constants.buttonBackground,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen(paginaInicial: 1)));
              },
              child: const Text(
                'Consultar estoque',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Constants.buttonBackground,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen(paginaInicial: 2)));
              },
              child: const Text(
                'Ajustar contagem',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Constants.buttonBackground,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen(paginaInicial: 3)));
              },
              child: const Text(
                'Conferência',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Sair',
                  style: TextStyle(color: Constants.details, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
