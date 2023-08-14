import 'package:http/http.dart' as http;
import '../modelos/articulo.dart';
import 'dart:convert';

import '../secret.dart';

class Noticias {

  List<Articulo> noticias  = [];

  Future<void> getNoticias() async{

    String url = "https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){

      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Articulo articulo = Articulo(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          noticias.add(articulo);
        }

      });
    }


  }


}


class NoticiasPorCategoria {

  List<Articulo> noticias  = [];

  Future<void> getNoticiasCategoria(String category) async{

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "https://newsapi.org/v2/top-headlines?language=es&category=$category&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Articulo articulo = Articulo(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          noticias.add(articulo);
        }

      });
    }


  }


}