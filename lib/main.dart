import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paracelos/src/pages/bienvenida_page.dart';
import 'package:paracelos/src/pages/inicio_page.dart';
import 'package:paracelos/src/theme/tema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/'       : ( BuildContext context ) => BienvenidaPage(),
        '/inicio'       : ( BuildContext context ) => InicioPage(),
      },
      theme: paracelsosTheme
    );
  }
}