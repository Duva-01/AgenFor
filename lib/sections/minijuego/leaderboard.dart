import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


var loginUser = FirebaseAuth.instance.currentUser;

class LeaderBoardScreen extends StatefulWidget {

  
  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        
        leading: TextButton(
              
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white,),
            ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                "Leader",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                child: Text(
              "Board",
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
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

        
                Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 375,
                    child: SingleChildScrollView(
                      
                      
                      child: MostrarPuntajes(),
                    ),
                  ),

              
                Expanded(
                  child: FadeInUpBig(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/leaderboard.gif",
                            ),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                ),
              
              
            ],
          ),
        
      ),
    );
  }
}

class MostrarPuntajes extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Puntuaciones").orderBy("puntuacion").snapshots(),
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
          reverse: true,
          itemBuilder: (context, i){

          
          QueryDocumentSnapshot x = snapshot.data.docs[i];
    
          return BounceInDown(
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
                        title: Text(x["usuario"], style: TextStyle(color: Colors.white),),
                        leading: CircleAvatar(
                          child: Text(x["puntuacion"].toString()),
                        ),
                      ),
                    ),
            
          );
        });
      }
    );
  }


}