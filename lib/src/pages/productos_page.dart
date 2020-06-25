import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paracelos/src/providers/directus_provider.dart';
import 'package:paracelos/src/widgets/catalogo_widget.dart';

class ProductosPage extends StatefulWidget {

  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final directusProvider = new DirectusProvider();
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFFE5E5E5),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab( text: 'Suplementos'),
                Tab( text: 'Dispositivos'),
              ],
            ),
            title: Text('Productos', style: GoogleFonts.roboto(fontSize: 20.0, color: Colors.white)),
            leading: Container(),
          ),
          body: TabBarView(
            children: [
              _listadoSuplementos(),
              _listadoDispositivos(),
            ],
          ),
        ),
    )
    );
  }

  Widget _listadoSuplementos() {

    return FutureBuilder(
      future: directusProvider.obtenerSuplementos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return 
                ListView.builder(
                  physics: (snapshot.data.length > 1) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                  controller: PageController(
                    viewportFraction: 1,
                    initialPage: 1
                  ),
                  itemBuilder: (context, i) => CatalogoItem(titulo: snapshot.data[i].suplemento, imagen: snapshot.data[i].imagen.fullUrl, alias: snapshot.data[i].alias, tipo: 1),
                  itemCount: snapshot.data.length,
                
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

  Widget _listadoDispositivos() {

    return FutureBuilder(
      future: directusProvider.obtenerDispositivos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return ListView.builder(
                  physics: (snapshot.data.length > 1) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                  controller: PageController(
                    viewportFraction: 1,
                    initialPage: 1
                  ),
                  itemBuilder: (context, i) => CatalogoItem(titulo: snapshot.data[i].dispositivo, imagen: snapshot.data[i].imagen.fullUrl, alias: snapshot.data[i].alias, tipo: 2),
                  itemCount: snapshot.data.length,
              
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