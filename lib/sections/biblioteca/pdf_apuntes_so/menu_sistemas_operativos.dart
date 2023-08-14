import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/apuntes_generales_fs.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/apuntes_generales_sc.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/apuntes_generales_so.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/apuntes_generales_ubuntu.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/apuntes_generales_windows7.dart';
import 'package:flutter/material.dart';


class MenuSistemasOperativosScreen extends StatelessWidget {
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
                            "  Apuntes Sistemas Operativos",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_SO()),
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
                            "  Apuntes Generales FS",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_FS()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5) ),
                    
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
                            "  Apuntes Sistemas Concurrentes",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_SC()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5) ),
                    
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
                            "  Apuntes Windows 7",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_WS7()),
                        );
                      }),
                ),

                Container(
                  
                  width: MediaQuery.of(context).size.width,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border(top: BorderSide(color: Colors.grey, width: 5), bottom: BorderSide(color: Colors.grey, width: 5), ),
                    
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
                            "  Apuntes Ubuntu",
                            style: TextStyle(color: Colors.purple[700], fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apuntes_Generales_Ubuntu()),
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
