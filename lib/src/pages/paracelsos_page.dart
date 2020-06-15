import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:paracelos/src/models/banner_model.dart';
import 'package:paracelos/src/providers/directus_provider.dart';
import 'package:paracelos/src/widgets/noticia_widget.dart';

class ParacelsosPage extends StatefulWidget {

  @override
  _ParacelsosPageState createState() => _ParacelsosPageState();
}

class _ParacelsosPageState extends State<ParacelsosPage> {
  final directusProvider = new DirectusProvider();

  Future _getTaskBanners;


  @override
  void initState() {
    _getTaskBanners = directusProvider.obtenerBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: <Widget>[
            _banner(_screenSize),
            Text('Última noticia', style: GoogleFonts.roboto(fontSize: 20.0)).py12(),
            Divider(
              color: Color(0xFF1C3664),
              height: 0.0,
              thickness: 5.0,
              indent: _screenSize.width * 0.40,
              endIndent: _screenSize.width * 0.40,
            ),
            Expanded(
              child: _ultimaNoticia().centered(),
            )
          ],
        )
      )
    );
  }

  Widget _banner(_screenSize) {

    return FutureBuilder<List> (
      future: _getTaskBanners,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return Container(
            height: 300,
            child: PageView.builder(
              physics: (snapshot.data.length > 1) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
              controller: PageController(
                viewportFraction: 1,
                initialPage: 1
              ),
              pageSnapping: false,
              itemBuilder: (context, i) => _slide(snapshot.data[i], _screenSize),
              itemCount: snapshot.data.length,
            )
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

  Widget _slide ( BannerPpal banner, _screenSize) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage( banner.imagen.fullUrl ),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: _screenSize.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black38
              ),
              child: Text(banner.titulo, style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)).pOnly(top: 12.0, left: 12.0, right: 12.0)
            ),
          ),
          SizedBox(
            width: _screenSize.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black38
              ),
              child: Html(
                defaultTextStyle: GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                data: banner.descripcion
              ).p12()
            ),
          ),
        ],
      ),
    );
  }

  Widget _ultimaNoticia() {

    return FutureBuilder(
      future: directusProvider.obtenerUltimaNoticia(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return Container(
            height: 300,
            child: PageView.builder(
              physics: (snapshot.data.length > 1) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
              controller: PageController(
                viewportFraction: 1,
                initialPage: 1
              ),
              itemBuilder: (context, i) => NoticiaItem(noticia: snapshot.data[i]),
              itemCount: snapshot.data.length,
            )
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