
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_ac/apuntes_generales_ac.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_ac/apuntes_generales_ec.dart';
import 'package:flutter/material.dart';


class MenuArquitecturaComputadoresScreen extends StatelessWidget {
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
                            "  Apuntes Estructura Computadores",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_EC()),
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
                            "  Apuntes Arquitectura Computadores",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_AC()),
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
