import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../main.dart';

final List<String> imgList = [
  'assets/images/imagen1_intro.png',
  'assets/images/imagen2_intro.png',
  'assets/images/imagen3_intro.png',
  'assets/images/imagen4_intro.png',
  'assets/images/imagen5_intro.png',
  'assets/images/imagen6_intro.png',
  ];

final List<Widget> imageSliders = imgList.map((item) => Container(

          child: Container(
            
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0, height: 300,),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class IntroScreen extends StatefulWidget {

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  
  VideoPlayerController _controller;

  void setStateIfMounted(f) {
  if (mounted) setState(f);
  }

  void cargar(){

    _controller = VideoPlayerController.asset('assets/videos/intro_video.mp4');
    
    

      _controller.addListener(() {
        setStateIfMounted(() {});
      });

    

    _controller.setLooping(true);
    _controller.initialize().then((_) => setStateIfMounted(() {}));
    _controller.play();

  }

  @override
  void initState() {
    if(this.mounted){
      super.initState();
      cargar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton.extended(
            
            backgroundColor: Colors.white,
            onPressed: () async {
              
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => HomeScreen(),
                    transitionsBuilder: (c, anim, a2, child) =>FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 300),
                  ),
                );
              
            },
            label: Text('Saltar', style: TextStyle(color: Colors.black),),
                  
          ),

      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          ZoomIn(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        '¡Bienvenido a Agenfor!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Aqui podras exprimir al maximo tu potencial y enforcarte en las partes mas importantes para tu desarrollo personal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ],
                ),
                height: 150,
                width: MediaQuery.of(context).size.width - 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(18)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FadeInDown(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: CarouselSlider(
                  options: CarouselOptions(
                    
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
