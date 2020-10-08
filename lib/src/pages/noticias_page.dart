import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:paracelsos/src/widgets/noticia_widget.dart';

class NoticiasPage extends StatefulWidget {

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  final directusProvider = new DirectusProvider();
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: <Widget>[
            _listadoNoticias()
          ],
        )
      )
    );
  }

  Widget _listadoNoticias() {

    return FutureBuilder(
      future: directusProvider.obtenerNoticias(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return Expanded(
                child: ListView.builder(
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