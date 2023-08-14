import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

import 'package:vibration/vibration.dart';
import 'package:in_app_review/in_app_review.dart';

AudioPlayer player = AudioPlayer();  
AudioCache cache = new AudioCache(prefix: 'assets/audio/'); 

class SesionEstudioScreen extends StatefulWidget {
  SesionEstudioScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SesionEstudioScreenState createState() => _SesionEstudioScreenState();
}

class _SesionEstudioScreenState extends State<SesionEstudioScreen> {

  

  String tiempo_sesion = '5 minutos';
  String cancion = 'Wake up';

  String audio_cache = 'wake_up.mp3';

  CountDownController _controller = CountDownController();
  int _duration = 300;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Sesion",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w600),
                  ),
                ),
                Flexible(
                    child: Text(
                  "Estudio",
                  style: TextStyle(
                      color: Colors.purple[600], fontWeight: FontWeight.w600),
                ))
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            
          ),
        extendBodyBehindAppBar: true,
        body: Container(
            decoration: BoxDecoration(
            
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/purple_background.gif",
                ),
                fit: BoxFit.cover),
          ),
            child: Center(
                child:
              FadeInDown(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                    height: 80,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: tiempo_sesion,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.deepPurple, fontSize: 20),
                        underline: Container(
                          height: 4,
                          color: Colors.purple,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            tiempo_sesion = newValue;
                          });
                        },
                        items: <String>[
                          '5 minutos',
                          '10 minutos',
                          '30 minutos',
                          '1 hora',
                          '2 horas'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                        SizedBox(width: 20,),
                      DropdownButton<String>(
                        value: cancion,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.deepPurple, fontSize: 20),
                        underline: Container(
                          height: 4,
                          color: Colors.purple,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            cancion = newValue;
                          });
                        },
                        items: <String>[
                          'Wake up',
                          'Reaching out',
                          'Adventure',
                          'King´s feast',
                          'Merry Bay'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  
                  CircularCountDownTimer(
                    
                    duration: _duration,
                    initialDuration: 0,
                    controller: _controller,
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 1.5,
                      ringColor: Colors.purple[200],
                    fillColor: Colors.purpleAccent[100],
                    fillGradient: LinearGradient(
                      colors: <Color>[
                        Colors.purple[200],
                        Colors.purple[900],
                      ],
                    ),
                      backgroundColor: Colors.purple,
                    backgroundGradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.purple[900],
                            Colors.purple[400],
                            Colors.purple[900],
                          ],
                        ),
                    strokeWidth: 20.0,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: 33.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.HH_MM_SS,
                    isReverse: false,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: false,
                    onStart: () {
                      print('Empieza temporizador');
                      
                    },
                    onComplete: () {
                      
                      print('Se acabo el tiempo');
                      if(contador == 0){
                        contador++;
                        Vibration.vibrate(amplitude: 128);
                      }
                      
                    },
                  )
                ],
                        ),
                  
              )
              ),
        ),
          floatingActionButton: FlipInY(
          child: Container(
            margin: EdgeInsets.only(bottom: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                ),
                _boton(title: "Comenzar",  onPressed: () async {
                    contador = 0;
                  aplicarCambios();
                  player.stop();
                  player = await cache.loop(audio_cache); 
                  _controller.restart(duration: _duration);
                  }
                ), 
                SizedBox(
                  width: 10,
                ),
                _boton(title: "Pausar", onPressed: () {
                  aplicarCambios();
                  player.stop();
                  _controller.pause();
                }),
                SizedBox(
                  width: 10,
                ),
                _boton(title: "Reanudar", onPressed: () async {
                  aplicarCambios();
                  _controller.resume();
                  player = await cache.loop(audio_cache); 
                }),
                SizedBox(
                  width: 10,
                ),
                _boton(
                    title: "Reiniciar",
                    onPressed: () {
                      
                      aplicarCambios();
                      player.stop();
                      _controller.restart(duration: _duration);
                      _controller.pause();
                      contador = 0;
                    }
                ),
              ],
            ),
          ),
            
        ),
      ),
        );
  }

  _boton({String title, VoidCallback onPressed}){

    return BouncingWidget(
      duration: Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0.2,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
         
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        
      ),
    );
  }
  
  void aplicarCambios(){

    if (tiempo_sesion == "5 minutos") {
      _duration = 300;
    }
    if (tiempo_sesion == "10 minutos") {
      _duration = 600;
    }
    if (tiempo_sesion == "30 minutos") {
      _duration = 1800;
    }
    if (tiempo_sesion == "1 hora") {
      _duration = 3600;
    }
    if (tiempo_sesion == "2 horas") {
      _duration = 7200;
    }

    if (cancion == "Wake up") {
      audio_cache = 'wake_up.mp3';
    }
    if (cancion == "Reaching out") {
      audio_cache = 'reaching_out.mp3';
    }
    if (cancion == "Adventure") {
      audio_cache = 'adventure.mp3';
    }
    if (cancion == "King´s feast") {
      audio_cache = 'king_feast.mp3';
    }
    if (cancion == "Merry Bay") {
      audio_cache = 'merry_bay.mp3';
    }
    
  }
}