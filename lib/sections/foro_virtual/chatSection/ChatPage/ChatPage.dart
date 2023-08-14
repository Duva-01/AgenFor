import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoGeneral.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'SalaForos.dart';
import 'perfil.dart';
import 'ConversationListScreen.dart';
import 'SignOut.dart';

import 'dart:async';
import 'dart:ui';
import 'package:intl/intl.dart';


class ChatPageScreen extends StatefulWidget {
  @override
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  
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

  final List<Widget> _tabItems = [ConversationListScreen(), ForosScreen(), MyProfileScreen(), SignOutPage()];
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          resizeToAvoidBottomInset: false,
          
          bottomNavigationBar: 
            
            CurvedNavigationBar(

              key: _bottomNavigationKey,
              index: 0,
              height: 60.0,

              items: <Widget>[
                
                Icon(Icons.new_releases, size: 30, color: Colors.white,),
                Icon(Icons.book, size: 30, color: Colors.white,),
                Icon(Icons.person, size: 30, color: Colors.white,),
                Icon(Icons.logout, size: 30, color: Colors.white,),
               
              ],

              color: Colors.purple,
              buttonBackgroundColor: Colors.purple,
              backgroundColor: Colors.purple[300],
              
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


