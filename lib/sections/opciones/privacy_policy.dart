import 'dart:async';

import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: MyAppBar("Politica", "Privacidad"),
      body:  WebView(
          initialUrl:  "https://github.com/Duva-01/Privacy-Policy-AgenFor-NoteBook/blob/main/privacy-policy-agenfor.md",
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
    );
  }

}