import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

import 'package:table_calendar/table_calendar.dart';


import 'NotesScreen.dart';

class AgendaScreen extends StatefulWidget {
  AgendaScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                "Mi",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                child: Text(
              "Agenda",
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
        child: Column(
          children: [
            FadeInDown(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(10),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ),
            FadeInUpBig(
              child: Container(
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                
                height: 180,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(6, 1),
                      spreadRadius: 0.2,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.purple[400],
                                Colors.purple[900],
                              ],
                            ),
                          ),
                          height: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Container(
                                height: 50,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amber[100],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: AutoSizeText("Mis Notas",
                                        style: TextStyle(fontSize: 40)),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 120,
                                margin: EdgeInsets.all(10),
                                
                                    child: 
                                      SliderButton(

                                        height: 30,
                                        width: 120,

                                        dismissible: false,
                                        buttonSize: 25,
                                        highlightedColor: Colors.amber,
                                        buttonColor: Colors.purple[900],
                                        action: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (c, a1, a2) =>
                                                  NotesScreen(),
                                              transitionsBuilder:
                                                  (c, anim, a2, child) =>
                                                      FadeTransition(
                                                          opacity: anim,
                                                          child: child),
                                              transitionDuration:
                                                  Duration(milliseconds: 300),
                                            ),
                                          );
                                        },
                                        label: Text(
                                          "Abrir agenda",
                                          style: TextStyle(
                                              color: Color(0xff4a4a4a),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                        ),
                                        icon: Icon(Icons.arrow_forward, color: Colors.amber,),
                                        boxShadow: BoxShadow(
                                            color:
                                                Colors.black,
                                            blurRadius: 2.0,
                                            spreadRadius: 2.0,
                                            offset: Offset.zero),
                                      ),
                                    )
                            ],
                          )),
                    ),
                    Container(
                      width: 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          right: BorderSide(color: Colors.black, width: 1),
                          top: BorderSide(color: Colors.black, width: 1),
                          bottom: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    Container(
                      width: 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          right: BorderSide(color: Colors.black, width: 1),
                          top: BorderSide(color: Colors.black, width: 1),
                          bottom: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    Container(
                      width: 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          right: BorderSide(color: Colors.black, width: 1),
                          top: BorderSide(color: Colors.black, width: 1),
                          bottom: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
