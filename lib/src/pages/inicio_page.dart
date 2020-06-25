import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:provider/provider.dart';
import 'package:paracelos/src/shared_preferences/preferencias_usuario.dart';

// Pages
import 'package:paracelos/src/pages/noticias_page.dart';
import 'package:paracelos/src/pages/paracelsos_page.dart';
import 'package:paracelos/src/pages/preguntar_page.dart';
import 'package:paracelos/src/pages/productos_page.dart';
import 'package:paracelos/src/pages/usuario_page.dart';

class InicioPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.bienvenida = true;
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        drawer: _NavegacionLateral(),
        appBar: AppBar(
          title: Image(
            image: AssetImage('assets/images/logo_horizontal_blue.png'),
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
   ),
    );
  }
}

class _NavegacionLateral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: 100,
                  image: AssetImage('assets/images/logo_vertical_blue.png')
                )
              ],
            )
          ).pOnly(bottom: 10.0),
          // ListTile(
          //   leading: Icon(Icons.contact_mail, color: Theme.of(context).accentColor),
          //   title: Text('Contacto'),
          //   trailing: Icon( Icons.keyboard_arrow_right ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, '/contacto');
          //   }
          // ),
          ListTile(
            leading: Icon(Icons.chat, color: Theme.of(context).accentColor),
            title: Text('Chat'),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/chat');
            }
          ),
          ListTile(
            leading: Icon(Icons.person, color: Theme.of(context).accentColor),
            title: Text('Autoría'),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/autoria');
            }
          ),
          ListTile(
            leading: Icon(Icons.receipt, color: Theme.of(context).accentColor),
            title: Text('Términos y condiciones'),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/terminos');
            }
          ),
          ListTile(
            leading: Icon(Icons.receipt, color: Theme.of(context).accentColor),
            title: Text('Políticas de privacidad'),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/politicas');
            }
          ),
          ListTile(
            leading: Icon(Icons.domain, color: Theme.of(context).accentColor),
            title: Text('Nosotros'),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nosotros');
            }
          )
        ],
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1C3664),
        unselectedItemColor: Color(0xFFD7DBF4),
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.blue),
        showUnselectedLabels: true,
        iconSize: 40.0,
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Noticias', style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text('Productos', style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Image(
              width: 60.0,
              image: AssetImage('assets/images/ico_menu.png')
            ),
            title: Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Conferencias', style: TextStyle(fontSize: 12),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            title: Text('Asistencia', style: TextStyle(fontSize: 12)),
          ),
        ])
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        NoticiasPage(),

        ProductosPage(),

        ParacelsosPage(),

        PreguntarPage(),

        UsuarioPage()

      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 2;
  PageController _pageController = new PageController(initialPage: 2);


  int get paginaActual => this._paginaActual;
  
  set paginaActual( int valor ) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut );

    notifyListeners();
  }

  PageController get pageController => this._pageController;

}