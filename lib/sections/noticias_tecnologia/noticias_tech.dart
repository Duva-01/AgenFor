import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'helper/noticias.dart';
import 'helper/widgets.dart';


class TechNewsPage extends StatefulWidget {
  @override
  _TechNewsPageState createState() => _TechNewsPageState();
}

class _TechNewsPageState extends State<TechNewsPage> {

  bool _loading;
  var _listaNoticias;

  void getNoticias() async {

    NoticiasPorCategoria noticias = NoticiasPorCategoria();
    await noticias.getNoticiasCategoria("Technology");

    _listaNoticias = noticias.noticias;

    if(this.mounted){

      setState(() {
        _loading = false;
      });

    }
    
  }

  @override
  void initState() {

    _loading = true;
    super.initState();

    getNoticias();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: MyAppBar("Noticias","Tecnologicas"),
      extendBodyBehindAppBar: true,
      
      body: Container(
        decoration: BoxDecoration(
          
          image: DecorationImage(
              image: AssetImage(
                "assets/images/purple_background.gif",
              ),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
            child: _loading
              ? Container(
                
                child: Center(
                    child: CircularProgressIndicator(),
                  )
              )
              : SingleChildScrollView(
                  child: Container(
                    
                    child: Column(
                        children: <Widget>[
                          FadeInDown(
                            child: Container(
                              margin: EdgeInsets.only(top: 16),
                            child: ListView.builder(
                                  itemCount: _listaNoticias.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                  
                                  return NuevaNoticia(
                                    imgUrl: _listaNoticias[index].urlToImage ?? "",
                                    title: _listaNoticias[index].title ?? "",
                                    desc: _listaNoticias[index].description ?? "",
                                    content: _listaNoticias[index].content ?? "",
                                    posturl: _listaNoticias[index].articleUrl ?? "",
                                  );
                                  }
                              ),
                                                  ),
                          ),
                          ],
                    ),
                  ),
                  ),
        ),
      ),
    );

  }

}

