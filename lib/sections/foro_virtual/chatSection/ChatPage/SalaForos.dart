import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_ac/menu_arquitectura_computadores.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/menu_sistemas_operativos.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/menu_apuntes_variado.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoArquitecturaComputadores.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoGeneral.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoPreguntas.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoProgramacion.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoSistemasOperativos.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';


class ForosScreen extends StatefulWidget {
  ForosScreen({Key key}) : super(key: key);

  @override
  _ForosScreenState createState() => _ForosScreenState();
}

class _ForosScreenState extends State<ForosScreen> {
  List<ScreenHiddenDrawer> itens = new List();

  @override
  void initState() {
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          
          name: "Foro General",
          selectedStyle: TextStyle(),
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.teal,
        ),
        BounceInDown(
          child: ForoGeneralScreen(),
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Foro Preguntas",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: ForoPreguntasScreen()
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Foro Programacion",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: ForoProgramacionScreen()
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Foro Sistemas Operativos",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: ForoSistemasOperativosScreen()
        )));
    
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Foro Arqui. Compt.",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: ForoArquitecturaComputadoresScreen()
        )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      
      child: HiddenDrawerMenu(
        
        backgroundColorMenu: Colors.purple[300],
        backgroundColorAppBar: Colors.purple,
        leadingAppBar: Icon(Icons.menu, color: Colors.white,),
        disableAppBarDefault: false,
        tittleAppBar: Text("Foros Virtuales", style:TextStyle(color: Colors.white),),
          screens: itens,
      )
    );
    
  }
}
