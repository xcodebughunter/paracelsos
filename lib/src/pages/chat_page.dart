import 'package:flutter/material.dart';
import 'package:paracelsos/src/providers/directus_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Chatpage extends StatelessWidget {
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
      body: WebView(
        initialUrl: 'https://tawk.to/chat/5eb4bdee81d25c0e5849e250/default',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}