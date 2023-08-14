import 'dart:async';
import 'package:agenda_informatico/register_page.dart';
import 'package:agenda_informatico/sections/opciones/opciones.dart';
import 'package:agenda_informatico/sections/minijuego/minijuego.dart';
import 'package:animate_do/animate_do.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sections/agenda/agenda.dart';
import 'sections/noticias_tecnologia/noticias_tech.dart';
import 'sections/biblioteca/biblioteca_digital.dart';
import 'sections/foro_virtual/IniciarChatApp.dart';
import 'sections/sesion_estudio/sesion_estudio.dart';
import 'register_page.dart';
import 'package:google_fonts/google_fonts.dart';


 void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Agenda de un Informatico',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.merriweather().fontFamily
        
      ),
      home: LoadingPage(),
      routes: {},
    );
  }
}

class LoadingPage extends StatefulWidget {

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> { 

  @override
  void initState() {
    super.initState();
    inicializar(); 
  }
  
  void inicializar() async{

    final prefs = await SharedPreferences.getInstance();
    bool registrado = prefs.getBool('registrado') ?? false;

    if(registrado){

      Timer(
      Duration(seconds: 5),
      ()=>Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => HomeScreen(),
              transitionsBuilder: (c, anim, a2, child) =>FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 1000),
            ),
          )
         );
    }

    else {

      Timer(
      Duration(seconds: 5),
      ()=>Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => RegisterScreen(),
              transitionsBuilder: (c, anim, a2, child) =>FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 2000),
            ),
          )
         );
    }

  }

  @override
  Widget build(BuildContext context) {

    return FlipInY(
      child: Container(
                    child: 
                      Container(
                      
                      margin: EdgeInsets.all(20),
                      alignment: Alignment.bottomCenter,
                      child: 
                          SizedBox(
                            width: 50,
                          height: 50,
                          child:  
                            
                            JelloIn(
                              child: LoadingIndicator(
                                indicatorType: Indicator.lineScale, 
                              )
                            ),
                        ),  
                    ),
                    
                    
                  decoration: 
                    
                  BoxDecoration(
                      color: Colors.white,
                    image: 
                        
                      DecorationImage(
                        
                        image: 
                            AssetImage(
                              "assets/images/logo.png"
                        ),
                        
                        fit: BoxFit.fitWidth
                                            
                      ),
                    ),
                ),
    );
  }
}

class HomeScreen extends StatefulWidget {

  int indice;
  HomeScreen({this.indice});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _tabItems = [TechNewsPage(), BibliotecaDigital(), AgendaScreen(),  SesionEstudioScreen(), IniciarChatApp(), GameScreen(), OptionsScreen()];


  int _activePage = 3;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

          
          extendBodyBehindAppBar: true,
          extendBody: true,
          bottomNavigationBar: 
            
            CurvedNavigationBar(

              key: _bottomNavigationKey,
              index: 3,
              height: 60.0,

              items: <Widget>[
                
                Icon(Icons.new_releases, size: 25, color: Colors.black,),
                Icon(Icons.book, size: 25, color: Colors.black,),
                Icon(Icons.menu_book, size: 25, color: Colors.black,),
                Icon(Icons.access_alarm, size: 25, color: Colors.black,),
                Icon(Icons.chat, size: 25, color: Colors.black,),
                Icon(Icons.gamepad, size: 25, color: Colors.black,),
                Icon(Icons.assessment, size: 25, color: Colors.black,),
               
              ],

              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              
              onTap: (index) {
                setState(() {
                _activePage = index;
                });
                
              },

              letIndexChange: (index) => true,
              
            ),
        
            body: _tabItems[_activePage],
              
            );
  }
}


