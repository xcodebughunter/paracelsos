import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:paracelsos/src/widgets/catalogo_widget.dart';

class PreguntarPage extends StatefulWidget {

  @override
  _PreguntarPageState createState() => _PreguntarPageState();
}

class _PreguntarPageState extends State<PreguntarPage> {
  final directusProvider = new DirectusProvider();
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: <Widget>[
            _listadoConferencias()
          ],
        )
      )
    );
  }



  Widget _listadoConferencias() {

    return FutureBuilder(
      future: directusProvider.obtenerConferencias(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return Expanded(
                child: ListView.builder(
                  physics: (snapshot.data.length > 1) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                  controller: PageController(
                    viewportFraction: 1,
                    initialPage: 1
                  ),
                  itemBuilder: (context, i) => CatalogoItem(titulo: snapshot.data[i].conferencia, imagen: snapshot.data[i].imagen.fullUrl, alias: snapshot.data[i].alias, tipo: 3),
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