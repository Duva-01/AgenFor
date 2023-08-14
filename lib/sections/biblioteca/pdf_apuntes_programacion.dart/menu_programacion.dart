import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_programacion.dart/apuntes_generales_c++.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_programacion.dart/apuntes_generales_html.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_programacion.dart/apuntes_generales_js.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_programacion.dart/apuntes_generales_python.dart';
import 'package:flutter/material.dart';
import 'apuntes_generales_pdoo.dart';

class MenuProgramacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Center(
            child: ListView(
              children: [

                Container(

                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), ),
                    
                  ),

                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple[700],
                            size: 20.0,
                          ),
                          Text(
                            "  Apuntes PDOO",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_PDOO()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), ),
                    
                  ),

                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple[700],
                            size: 20.0,
                          ),
                          Text(
                            "  Apuntes C++",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_C()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), ),
                    
                  ),

                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple[700],
                            size: 20.0,
                          ),
                          Text(
                            "  Apuntes Python",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_Python()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), ),
                    
                  ),

                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple[700],
                            size: 20.0,
                          ),
                          Text(
                            "  Apuntes JavaScript",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_JS()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), bottom: BorderSide(color: Colors.grey, width: 5),),
                    
                  ),

                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: Colors.purple[700],
                            size: 20.0,
                          ),
                          Text(
                            "  Apuntes Generales HTML, CSS y JS",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_HTML()),
                        );
                      }),
                ),
                
                
              ],
            ),
          ),
        ),
      
    );
  }
}
