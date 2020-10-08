import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:paracelsos/src/models/secciones_model.dart';
import 'package:paracelsos/src/widgets/seccion_widget.dart';

class NosotrosPage extends StatefulWidget {
  @override
  _NosotrosPageState createState() => _NosotrosPageState();
}

class _NosotrosPageState extends State<NosotrosPage> {
  final directusProvider = new DirectusProvider();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
        title: Image(
          image: AssetImage('assets/images/logo_horizontal_blue.png'),
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      );

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: appBar,
      body: Column(
        children: <Widget>[
          _nosotrosSeccion(appBar.preferredSize.height)
        ],
      )
    );
  }

  Widget _nosotrosSeccion(double appBarHeight) {

    return FutureBuilder(
      future: directusProvider.obtenerNosotros(),
      builder: (BuildContext context, AsyncSnapshot<Seccion> snapshot) {
        
        if ( snapshot.hasData ) {
          return Container(
            height: MediaQuery.of(context).size.height - (appBarHeight * 2),
            child: PageView.builder(
              physics: (snapshot.data != null) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
              controller: PageController(
                viewportFraction: 1,
                initialPage: 1
              ),
              itemBuilder: (context, i) => SeccionItem(seccion: snapshot.data)
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