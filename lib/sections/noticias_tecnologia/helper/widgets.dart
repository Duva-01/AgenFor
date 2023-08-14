import 'package:flutter/material.dart';
import '../vista_articulos.dart';


Widget MyAppBar(String texto1, String texto2){

  return AppBar(

    title: Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Flexible(
          child: Text(
            "${texto1}",
            style:
            TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ),
        Flexible(
          child: Text(
            "${texto2}",
            style: TextStyle(color: Colors.purple[600], fontWeight: FontWeight.w600),
          )
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,

  );

}


class NuevaNoticia extends StatelessWidget {

  final String imgUrl, title, desc, content, posturl;

  NuevaNoticia({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => VistaArticulo(
              postUrl: posturl,
            )
        ));
      },

      child: Container(

          margin: EdgeInsets.only(bottom: 24, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(

            color: Colors.purple[50],
            //border: new Border.all(width: 3.0, color: Colors.purple), 
            boxShadow: [

              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 15),
                blurRadius: 10.0,
              ),
            ],

            borderRadius: 
              BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
             ),  

          ),

          child: Container(
            
            margin: EdgeInsets.all(10),
            child: Container(

              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: <Widget>[
                  
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 4,
                  ),

                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(height: 12,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,

                        loadingBuilder: (BuildContext ctx, Widget child, ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }else {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[700]),
                              ),
                            );
                          }
                        },

                        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                          return Image.asset("assets/images/logo.png");
                        }
                      ),
                  ),

                  

                  

            
                ],
              ),
            ),

          ),
        ),
      );


  }
}