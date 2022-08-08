import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart' as http;

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  String endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3dba1c7ece4249ad8695f8bc2ee40d03";
  var url = Uri.https('newsapi.org','v2/top-headlines?',{'q': 'country=us&category=business&apiKey=3dba1c7ece4249ad8695f8bc2ee40d03'});
  //Now let's create the http request function
  // but first let's import the http package
  //Uri ur=Uri.parse(endPointUrl);

  Future<List<Article>>  getArticle() async {

      var uri = Uri.https('newsapi.org', "v2/top-headlines", {
        "country": "us",
        "category": "business",

      });
      var response = await http.get(
        uri,
        headers: {"X-Api-key": "3dba1c7ece4249ad8695f8bc2ee40d03"},
      );
   // var res = await http.get(url);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}