import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';


class Apuntes_Generales_FS extends StatefulWidget {
  const Apuntes_Generales_FS({Key key}) : super(key: key);

  @override
  _Apuntes_Generales_FSState createState() => _Apuntes_Generales_FSState();
}

class _Apuntes_Generales_FSState extends State<Apuntes_Generales_FS> {
  bool _isLoading = true;
  PDFDocument _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    _pdf = await PDFDocument.fromAsset('assets/apuntes/apuntes_generales_fs.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Libro: ", "Fundamentos de Software"),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: _pdf)),
    );
  }
}