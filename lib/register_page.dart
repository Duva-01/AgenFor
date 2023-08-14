import 'package:agenda_informatico/main.dart';
import 'package:agenda_informatico/sections/opciones/intro.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final nuevoTexto = TextEditingController();
  final nuevoNumero = TextEditingController();
  final nuevoEstudios = TextEditingController();
  final nuevoEstado = TextEditingController();

  bool esChica = false;

  @override
  void dispose() {
    
    nuevoTexto.dispose();
    nuevoNumero.dispose();
    nuevoEstado.dispose();
    nuevoEstudios.dispose();
    super.dispose();
  }

  void registrarse(String nombre, int edad, String estudios, String estado) async {

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nombre', nombre);
    prefs.setInt('edad', edad);
    prefs.setString('estudios', estudios);
    prefs.setString('estado', estado);
    prefs.setBool('esChica', esChica);
    prefs.setBool('registrado', true);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton.extended(
            
            backgroundColor: Colors.purple[700],
            onPressed: () async {

              if(nuevoTexto.text.isNotEmpty && nuevoNumero.text.isNotEmpty && nuevoEstado.text.isNotEmpty && nuevoEstudios.text.isNotEmpty){
                
                registrarse(nuevoTexto.text, int.parse(nuevoNumero.text), nuevoEstudios.text, nuevoEstado.text);

                nuevoTexto.clear();
                nuevoNumero.clear();
                nuevoEstado.clear();
                nuevoEstudios.clear();

                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => IntroScreen(),
                    transitionsBuilder: (c, anim, a2, child) =>FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 3000),
                  ),
                );
              }
            },
            label: Text('Enviar', style: TextStyle(color: Colors.white),),
                  
          ),

          body: 

            Container(

              decoration: 
                BoxDecoration(
                  color: Colors.white,
              ),

              child: 
                Center(

                  child:

                    BounceInDown(
                          child:
                          ListView(
                              children: [
                                
                                
                                Container(
                                  
                                  margin: EdgeInsets.only(top:40, left: 30),
                                    child: 
                                      Center(
                                      child: Row(
                                        children: [
                                          

                                          Text("Agen", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.purple[700]),textAlign: TextAlign.center,),
                                          Text("da", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                          
                                          ],
                                      ),
                                    ),
                                ),
                                Container(
                                  
                                  margin: EdgeInsets.only(top:10, left: 60),
                                    child: 
                                      Center(
                                      child: Row(
                                        children: [
                                          
                                          Text("In", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                          Text("for", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.purple[700]),textAlign: TextAlign.center,),
                                          Text("mática", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                          ],
                                      ),
                                    ),
                                ),
                                Container(
                                  
                                  margin: EdgeInsets.only(top:20),
                                  child: 
                                    Center(
                                      child: Text("Por favor rellena estos datos:", style: TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center,),
                                    ),
                                ),
                                
                                Container(
                                    
                                  margin: EdgeInsets.all(10),
                                  
                                  child: 
                                
                                    Container(
                                      width: 300,
                                      child:
                                      TextField(
                                          
                                          controller: nuevoTexto,
                                          decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            labelText: 'Nombre y Apellidos',
                                            border: OutlineInputBorder(),
                                          ),
                                      ),
                                    ),
                                  ),     
                                Container(
                                    margin: EdgeInsets.all(10),
                                  child: 
                                
                                    Container(
                                      width: 300,
                                      child:
                                      TextField(
                                        controller: nuevoNumero,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Edad',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                ), 
                                Container(
                                    
                                  margin: EdgeInsets.all(10),
                                  
                                  child: 
                                
                                    Container(
                                      width: 300,
                                      child:
                                      TextField(
                                          
                                          controller: nuevoEstudios,
                                          decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            labelText: 'Estudios',
                                            border: OutlineInputBorder(),
                                          ),
                                      ),
                                    ),
                                ),     
                                Container(
                                    
                                  margin: EdgeInsets.all(10),
                                  
                                  child: 
                                
                                    Container(
                                      width: 300,
                                      child:
                                      TextField(
                                          
                                          controller: nuevoEstado,
                                          decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            labelText: 'Estado',
                                            border: OutlineInputBorder(),
                                          ),
                                      ),
                                    ),
                                  ),     
                                Container(
                                  
                                  margin: EdgeInsets.all(20),
                                    child: 
                                      Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          
                                          Text("Chico", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                            Switch(
                                            value: esChica, 
                                            inactiveThumbColor: Colors.indigo[900],
                                            inactiveTrackColor: Colors.indigo,
                                            onChanged: (value) {
                                              setState(() {
                                                esChica = value;
                                              });
                                            },
                                            activeTrackColor: Colors.purple[200],
                                            activeColor: Colors.purple[700],
                                          ),
                                            Text("Chica", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                          ],
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                    ),
                ),
        );

    

  }
}