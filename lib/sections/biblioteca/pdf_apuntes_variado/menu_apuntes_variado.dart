import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/apuntes_generales_algebra.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/apuntes_generales_algoritmica.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/apuntes_generales_calculo.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/apuntes_generales_ed.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/apuntes_generales_fisica.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/apuntes_generales_logica.dart';
import 'package:flutter/material.dart';


class MenuApuntesVariadosScreen extends StatelessWidget {
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
                            "  Apuntes Algebra",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_Algebra()),
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
                            "  Apuntes Algoritmica",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_Algoritmica()),
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
                            "  Apuntes Calculo",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_Calculo()),
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
                            "  Apuntes Estructura de Datos",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_ED()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5)),
                    
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
                            "  Apuntes FFT",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_FFT()),
                        );
                      }),
                ),
                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), bottom: BorderSide(color: Colors.grey, width: 5)),
                    
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
                            "  Apuntes Logica y Metodos discretos.",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_Logica()),
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
