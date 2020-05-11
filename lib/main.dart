import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages
import 'package:paracelos/src/pages/bienvenida_page.dart';
import 'package:paracelos/src/pages/chat_page.dart';
import 'package:paracelos/src/pages/inicio_page.dart';

// Theme
import 'package:paracelos/src/theme/tema.dart';

// Shared Preference
import 'package:paracelos/src/shared_preferences/preferencias_usuario.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (prefs.bienvenida) ? '/inicio' : '/',
      routes: {
        '/'             : ( BuildContext context ) => BienvenidaPage(),
        '/inicio'       : ( BuildContext context ) => InicioPage(),
        '/chat'         : ( BuildContext context ) => ChatPage(),
      },
      theme: paracelsosTheme
    );
  }
}