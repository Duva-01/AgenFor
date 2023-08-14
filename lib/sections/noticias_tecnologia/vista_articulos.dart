import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VistaArticulo extends StatefulWidget {

  final String postUrl;
  VistaArticulo({@required this.postUrl});

  @override
  _VistaArticuloState createState() => _VistaArticuloState();
}

class _VistaArticuloState extends State<VistaArticulo> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: MyAppBar("Noticias", "Tecnologia"),

      body: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        
        child: WebView(
          initialUrl:  widget.postUrl,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),

      ),
    );
  }
}
