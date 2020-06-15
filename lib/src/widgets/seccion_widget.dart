import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:paracelos/src/models/secciones_model.dart';


class SeccionItem extends StatelessWidget {
  
  final Seccion seccion;
  
  SeccionItem({ @required this.seccion });
   @override
    Widget build(BuildContext context) {
      return
       Container(
        padding: EdgeInsets.only(bottom: 30.0),
        color: Color.fromRGBO(63, 93, 178, 0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[ 
            Text(seccion.seccion),
            Html(
              defaultTextStyle: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
              data: seccion.contenido
            ).p12()
          ],
        )
      );
  }
}