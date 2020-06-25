import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:google_fonts/google_fonts.dart';


class CatalogoItem extends StatelessWidget {
  
  final String titulo;
  final String imagen;
  final String alias;
  final int tipo;
  
  CatalogoItem({ @required this.titulo, @required this.imagen, @required this.alias, @required this.tipo });
   @override
    Widget build(BuildContext context) {

      String url;

      switch(tipo) {
        case 1:
          url = '/suplemento';
          break;
        case 2:
          url = '/dispositivo';
          break;
        case 3:
          url = '/conferencia';
          break;
      }

      return Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage( imagen ),
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
              Text(
                titulo,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis  
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                color: Color(0xFFa2adbc),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ), 
                child: Text('Ver', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                onPressed: () => {
                  Navigator.pushNamed(context, url, arguments: alias),
                }
              ).pOnly(top: 30.0)
            ],
          ),
        )
      ).pOnly(bottom: 10.0);
  }
}