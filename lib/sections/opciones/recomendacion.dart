import 'dart:async';

import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GrumeteScreen extends StatefulWidget {

  @override
  _GrumeteScreenState createState() => _GrumeteScreenState();
}

class _GrumeteScreenState extends State<GrumeteScreen> {
  
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: MyAppBar("Diario", "Grumete"),
      body:  WebView(
          initialUrl:  "https://play.google.com/store/apps/details?id=com.david.diario_grumete&hl=es_419&gl=US",
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
    );
  }

}