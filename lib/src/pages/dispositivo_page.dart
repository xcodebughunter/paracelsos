import 'package:flutter/material.dart';
import 'package:paracelos/src/providers/directus_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class DispositivoPage extends StatefulWidget {

  @override
  _DispositivoPageState createState() => _DispositivoPageState();
}

class _DispositivoPageState extends State<DispositivoPage> {
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
            _dispositivo( alias )
          ,
        )
    );
  }
  Widget _dispositivo(String alias) {

    return FutureBuilder(
      future: directusProvider.obtenerDispositivoDetalle(alias),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if ( snapshot.hasData ) {
          final dispositivo = snapshot.data;

          return Container(
            child: Column(children: <Widget>[
              Image(
                image: NetworkImage( dispositivo.imagen.fullUrl ),
                fit: BoxFit.fill, 
                width: MediaQuery.of(context).size.width,
              ),
              Text(dispositivo.dispositivo, textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 40.0, color: Color(0xFF212529))).py16(),
              Html(
                defaultTextStyle: GoogleFonts.roboto(color: Colors.black, fontSize: 16.0),
                data: dispositivo.descripcion
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