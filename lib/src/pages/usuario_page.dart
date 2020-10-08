import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class UsuarioPage extends StatefulWidget {

  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final directusProvider = new DirectusProvider();

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: SingleChildScrollView(
          child:
            _asesoria()
          ,
        )
      )
    );
  }
  Widget _asesoria() {

    return FutureBuilder(
      future: directusProvider.obtenerAsistenciaDetalle(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if ( snapshot.hasData ) {
          final asistencia = snapshot.data;

          return Container(
            child: Column(children: <Widget>[
              Image(
                image: NetworkImage( asistencia.imagen.fullUrl ),
                fit: BoxFit.fill, 
                width: MediaQuery.of(context).size.width,
              ),
              Text(asistencia.asesoria, textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 40.0, color: Color(0xFF212529))).py16(),
              Html(
                defaultTextStyle: GoogleFonts.roboto(color: Colors.black, fontSize: 16.0),
                data: asistencia.descripcion
              ).p12(),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                color: Color(0xFF1c3664),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ), 
                child: Text('Solicitar información', style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0)),
                onPressed: () => {
                  Navigator.pushNamed(context, '/chat'),
                }
              ).pOnly(top: 30.0)
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