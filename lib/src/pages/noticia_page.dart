import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticiaPage extends StatefulWidget {

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiaPage> {
  final directusProvider = new DirectusProvider();

  @override
  Widget build(BuildContext context) {
  
    final String alias = ModalRoute.of(context).settings.arguments;

    AppBar appBar = AppBar(
        title: Image(
          image: AssetImage('assets/images/logo_horizontal_blue.png'),
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      );

    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        appBar: appBar,
        body: SingleChildScrollView(
          child:
            _noticia( alias )
          ,
        )
    );
  }
  Widget _noticia(String alias) {

    return FutureBuilder(
      future: directusProvider.obtenerNoticiaDetalle(alias),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if ( snapshot.hasData ) {
          final noticia = snapshot.data;

          return Container(
            child: Column(children: <Widget>[
              Image(
                image: NetworkImage( noticia.imagen.fullUrl ),
                fit: BoxFit.fill, 
                width: MediaQuery.of(context).size.width,
              ),
              Text(noticia.titulo, textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 40.0, color: Color(0xFF212529))).py16(),
              Html(
                defaultTextStyle: GoogleFonts.roboto(color: Colors.black, fontSize: 16.0),
                data: noticia.contenido
              ).p12()
            ],),
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    );
  }
}