import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';


class ConferenciaPage extends StatefulWidget {

  @override
  _ConferenciaPageState createState() => _ConferenciaPageState();
}

class _ConferenciaPageState extends State<ConferenciaPage> {
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
            _conferencia( alias )
          ,
        )
    );
  }
  Widget _conferencia(String alias) {

    return FutureBuilder(
      future: directusProvider.obtenerConferenciaDetalle(alias),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if ( snapshot.hasData ) {
          final conferencia = snapshot.data;

          return SingleChildScrollView (
          child: Container(
            child: Column(children: <Widget>[
              Image(
                image: NetworkImage( conferencia.imagen.fullUrl ),
                fit: BoxFit.fill, 
                width: MediaQuery.of(context).size.width,
              ),
              
              Text(conferencia.conferencia, textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 40.0, color: Color(0xFF212529))).py16(),
              Html(
                defaultTextStyle: GoogleFonts.roboto(color: Colors.black, fontSize: 16.0),
                data: conferencia.descripcion
              ).p12(),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                color: Color(0xFF1c3664),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ), 
                child: Text('Ver video', style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0)),
                onPressed: () => {
                  _launchURL(conferencia.video)
                }
              ).pOnly(top: 30.0),
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
          ));
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


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}