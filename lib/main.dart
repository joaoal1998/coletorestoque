import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/consultar_estoque_screen.dart';
import 'screens/ajustar_contagem_screen.dart';
import 'screens/conferencia_screen.dart';

void main() {
  runApp(KinitosFestasApp());
}

class KinitosFestasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kinitos Festas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/menu': (context) => MenuScreen(),
        '/consultarEstoque': (context) => ConsultarEstoqueScreen(),
        '/ajustarContagem': (context) => AjustarContagemScreen(),
        '/conferencia': (context) => ConferenciaScreen(),
      },
    );
  }
}
