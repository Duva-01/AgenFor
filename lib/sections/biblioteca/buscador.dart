import 'dart:async';

import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ChatPage.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoGeneral.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:animate_do/animate_do.dart';

class BuscadorScreen extends StatefulWidget {

  @override
  _BuscadorScreenState createState() => _BuscadorScreenState();
}

class _BuscadorScreenState extends State<BuscadorScreen> {
  
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:  WebView(
          initialUrl:  "https://www.google.com/",
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
    );
  }

}