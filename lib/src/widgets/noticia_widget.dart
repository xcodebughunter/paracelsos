import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:paracelos/src/models/noticia_model.dart';
import 'package:intl/intl.dart';


class NoticiaItem extends StatelessWidget {
  
  final Noticia noticia;
  
  NoticiaItem({ @required this.noticia });
   @override
    Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage( noticia.imagen.fullUrl ),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter
          )
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 30.0),
          color: Color.fromRGBO(63, 93, 178, 0.6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Salud / ' + new DateFormat("MMM d, y").format(DateTime.parse(noticia.fecha)), style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(
                noticia.titulo,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis  
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                color: Color(0xFFA4F4F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ), 
                child: Text('Leer más'),
                onPressed: () => {}
              ).pOnly(top: 30.0)
            ],
          ),
        )
      );
  }
}