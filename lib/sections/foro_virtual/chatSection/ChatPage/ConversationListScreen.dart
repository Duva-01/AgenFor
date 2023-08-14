import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoGeneral.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'PrivateChat.dart';
final nuevaBusqueda = TextEditingController();
var loginUser = FirebaseAuth.instance.currentUser;

class ConversationListScreen extends StatefulWidget {
  @override
  _ConversationListScreenState createState() => _ConversationListScreenState();
}

class _ConversationListScreenState extends State<ConversationListScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                "Mis",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                child: Text(
              "Contactos",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ))
          ],
        ),
        backgroundColor: Colors.purple,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/purple_background.gif",
              ),
              fit: BoxFit.cover),
        ),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [

                    Container(
                      
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: TextField(
                        controller: nuevaBusqueda,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey.shade100)),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    height: 400,
                    margin: EdgeInsets.only(bottom: 16),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: MostrarPersonas(),
                    ),
                  ),
              ),
              
              
            ],
          ),
        ),
      
    );
  }
}

class MostrarPersonas extends StatelessWidget {
  
  var formato = new DateFormat.yMd().add_jm();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: nuevaBusqueda.text == "" ? FirebaseFirestore.instance.collection("Contactos").snapshots() : FirebaseFirestore.instance.collection("Contactos").where('nombre', isEqualTo: nuevaBusqueda.text).snapshots(),
      builder: (context, snapshot){

        if(!snapshot.hasData){
          return Center(

            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          primary: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, i){

          
          QueryDocumentSnapshot x = snapshot.data.docs[i];
          final almacenarContacto = FirebaseFirestore.instance;
          
          
          return loginUser.email.toString() == x["usuario"] ? SizedBox(height: 0, width: 0,) 
          
          : GestureDetector(

            onTap: () {
                Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => PrivateChat(nombre_usuario_externo: x["nombre"], email_externo: x["usuario"],),
                transitionsBuilder: (c, anim, a2, child) =>FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 200),
              ),
            
            );},

            child: FadeInLeft(
              child: Container(
                        margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.purple[900],
                  Colors.purple[400],
                                ],
                              ),
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
                      child: ListTile(
                        title: Text(x["nombre"], style: TextStyle(color: Colors.white),),
                        subtitle: Text(x["usuario"], style: TextStyle(color: Colors.purple[100])),
                        leading: CircleAvatar(
                          child: Text(x["nombre"][0]),
                        ),
                      ),
                    ),
            ),
          );
        });
      }
    );
  }


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
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        
      ),
    );
  }


