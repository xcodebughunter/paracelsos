import 'package:flutter/material.dart';

class ProductosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: <Widget>[
            Text('Productos')
          ],
        )
      )
    );
  }
}