import 'package:flutter/material.dart';

class TerminosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Image(
          image: AssetImage('assets/images/logo_horizontal_blue.png'),
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('TerminosPage')
        ],
      )
    );
  }
}