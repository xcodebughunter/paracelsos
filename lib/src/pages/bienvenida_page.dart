import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class BienvenidaPage extends StatelessWidget {

  final List<Color> _colors = [Color(0xFF1C3664), Color(0xFF1C3664)];
  final List<double> _stops = [0.0, 0.7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _colors,
            stops: _stops
          )
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo_vertical_blue.png'),
                  width: MediaQuery.of(context).size.width * 0.7,
                ).pOnly(bottom: 40.0).centered(),
                Text(
                  'Toma el control de tu salud',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0)
                  )
                ).pSymmetric(v: 30.0),
                RaisedButton(
                  color: Color(0xFFA2ADBC),
                  textColor: Color(0xFFFFFFFF),
                  child: Text('Empezar', style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/inicio');
                  },
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA2ADBC)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                      )
                  ),
                ).pOnly(top: 30.0),
                Text(
                  '© 2020 Paracelsos. todos los derechos reservados',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.white)
                  )
                ).pOnly(bottom: 30.0, top: 100.0),
              ]
            )
          ],
        ),
      )
    );
  }
}
