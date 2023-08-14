import 'dart:async';
import 'dart:math';

import 'package:agenda_informatico/sections/minijuego/leaderboard.dart';
import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:vibration/vibration.dart';

String nombre;

AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);  
AudioCache cache = new AudioCache(prefix: 'assets/audio/'); 

class GameScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          
          leading: TextButton(
              
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => LeaderBoardScreen(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 200),
                  )
                );
              },
              child: Icon(Icons.cloud, color: Colors.purple,),
            ),

    title: Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Flexible(
          child: Text(
            "Mini",
            style:
            TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ),
        Flexible(
          child: Text(
            "Juego",
            style: TextStyle(color: Colors.purple[600], fontWeight: FontWeight.w600),
          )
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,

    ),
        extendBodyBehindAppBar: true,
        body: 
        Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/purple_background.gif",
                    ),
                    fit: BoxFit.cover),
              ),

              child:Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                child: MiniJuego()
              ),
              
        ),
        
      );
  }
}

class MiniJuego extends StatefulWidget {
  MiniJuego({Key key}) : super(key: key);

  @override
  _MiniJuegoState createState() => _MiniJuegoState();
}

class _MiniJuegoState extends State<MiniJuego> {
  
  void getNombre() async {
    final prefs = await SharedPreferences.getInstance();
    nombre = prefs.getString('nombre');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNombre();
  }
  static final _rng = Random();

  Color _color = Colors.red;
  double _width = 100, _height = 100, _radius = 25;
  Alignment _alignment = Alignment(0.5, 0.5);

  int _score = 0;
  void _randomize() {
    _color = Color.fromARGB(
      180,
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );

    _width = _rng.nextDouble() * 120 + 30;
    _height = _rng.nextDouble() * 120 + 30;
    _radius = min(_width, _height) / 3 + 10;
    _alignment = Alignment(
      _rng.nextDouble() * 2 - 1,
      _rng.nextDouble() * 2 - 1,
    );
  }

  void _increaseScore() {
    _score++;
  }

  Timer _timer;
  int _countDown = 10;
  bool _isPlaying = false;

  void _startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          // print(_countDown);
          if (_countDown < 1) {
            _endGame();
            if(this.mounted){
              timer.cancel();
            }
              
          } else {
            _countDown--;
          }
        },
      ),
    );
  }

  void _startGame() {
    _score = 0;
    _countDown = 10;
    _isPlaying = true;
    _randomize();
    _startTimer();
  }

  void _endGame() {
    _isPlaying = false;
    final almacenarPuntuacion = FirebaseFirestore.instance;

    Vibration.vibrate(amplitude: 128);

    almacenarPuntuacion.collection("Puntuaciones").doc().set({
      "usuario": nombre,
      "puntuacion": _score,
    });
  }

  @override
  void dispose() {
    if(this.mounted){
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        
        Center(
          child: FadeInDown(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Score: $_score',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        decoration: TextDecoration.none)),
                _isPlaying
                    ? Text('$_countDown',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            decoration: TextDecoration.none))
                    : GestureDetector(
                        onTap: () => setState(() {
                          _startGame();
                        }),
                        child: Text('Start',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                decoration: TextDecoration.none)),
                      ),
              ],
            ),
          ),
        ),
        if (_isPlaying)
          GestureDetector(
              onTap: () => setState(() async {
                    _countDown += _score % 2;
                    _increaseScore();
                    _randomize();
                    player = await cache.play("boing.mp3");
                  }),
              child: _Box(
                  alignment: _alignment,
                  height: _height,
                  width: _width,
                  color: _color,
                  radius: _radius)),
      ],
    );

    
  }

}

class _Box extends StatelessWidget {
  const _Box({
    Key key,
    @required Alignment alignment,
    @required double height,
    @required double width,
    @required Color color,
    @required double radius,
  })  : _alignment = alignment,
        _height = height,
        _width = width,
        _color = color,
        _radius = radius,
        super(key: key);

  final Alignment _alignment;
  final double _height;
  final double _width;
  final Color _color;
  final double _radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: AnimatedAlign(
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 820),
        alignment: _alignment,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 820),
          curve: Curves.ease,
          height: _height,
          width: _width,
          decoration: BoxDecoration(
              color: _color, borderRadius: BorderRadius.circular(_radius)),
        ),
      ),
    );
  }
}


