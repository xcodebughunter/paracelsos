import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paracelos/src/pages/autoria_page.dart';

// Pages
import 'package:paracelos/src/pages/bienvenida_page.dart';
import 'package:paracelos/src/pages/chat_page.dart';
import 'package:paracelos/src/pages/conferencia_page.dart';
import 'package:paracelos/src/pages/contacto_page.dart';
import 'package:paracelos/src/pages/dispositivo_page.dart';
import 'package:paracelos/src/pages/inicio_page.dart';
import 'package:paracelos/src/pages/nosotros_page.dart';
import 'package:paracelos/src/pages/politicas_page.dart';
import 'package:paracelos/src/pages/suplemento_page.dart';
import 'package:paracelos/src/pages/terminos_page.dart';
import 'package:paracelos/src/pages/noticia_page.dart';

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
        '/contacto'     : ( BuildContext context ) => ContactoPage(),
        '/autoria'      : ( BuildContext context ) => AutoriaPage(),
        '/terminos'     : ( BuildContext context ) => TerminosPage(),
        '/politicas'    : ( BuildContext context ) => PoliticasPage(),
        '/nosotros'     : ( BuildContext context ) => NosotrosPage(),
        '/chat'         : ( BuildContext context ) => Chatpage(),

        // Detalle
        '/noticia'      : ( BuildContext context ) => NoticiaPage(),
        '/conferencia'  : ( BuildContext context ) => ConferenciaPage(),
        '/dispositivo'  : ( BuildContext context ) => DispositivoPage(),
        '/suplemento'   : ( BuildContext context ) => SuplementoPage(),
      },
      theme: paracelsosTheme
    );
  }
}