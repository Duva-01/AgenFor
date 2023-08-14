import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_ac/menu_arquitectura_computadores.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_so/menu_sistemas_operativos.dart';
import 'package:agenda_informatico/sections/biblioteca/pdf_apuntes_variado/menu_apuntes_variado.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'pdf_apuntes_programacion.dart/menu_programacion.dart';
import 'buscador.dart';

class BibliotecaDigital extends StatefulWidget {
  BibliotecaDigital({Key key}) : super(key: key);

  @override
  _BibliotecaDigitalState createState() => _BibliotecaDigitalState();
}

class _BibliotecaDigitalState extends State<BibliotecaDigital> {
  List<ScreenHiddenDrawer> itens = new List();

  @override
  void initState() {
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          
          name: "Programacion",
          selectedStyle: TextStyle(),
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.teal,
        ),
        BounceInDown(
          child: MenuProgramacionScreen()
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Sistemas Operativos",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: MenuSistemasOperativosScreen()
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Arquitectura Computadores",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: MenuArquitecturaComputadoresScreen()
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Apuntes otras asignaturas",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: MenuApuntesVariadosScreen()
        )));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          selectedStyle: TextStyle(),
          name: "Buscador",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
          colorLineSelected: Colors.orange,
        ),
        BounceInDown(
          child: BuscadorScreen()
        )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.teal[800],
      backgroundColorAppBar: Colors.grey[300],
      screens: itens,
    );
    
  }
}
