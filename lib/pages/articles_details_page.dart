//Now let's create the article details page

import 'package:newsapp/model/article_model.dart';
import 'package:flutter/material.dart';
class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(toolbarHeight: 0),
      body: Container(


        child: Stack(

          children: [
            Stack(alignment: Alignment.bottomCenter,
              children: [




               Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(image: NetworkImage(article.urlToImage),fit: BoxFit.cover,),
                // decoration: BoxDecoration(
                //   //let's add the height
                //
                //   image: DecorationImage(
                //       image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                // ),
              ),

                Container(
                  alignment: Alignment.center,
margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                  Container(

                    child: Text(
                      article.title,
                      style: TextStyle(
                        color: Color(0xfff2f2f2),
                        fontSize: 29
                      ),
                    ),
                  ),
SizedBox(height: 64,),

            Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text(
                article.source.name,
                style: TextStyle(
                  color: Color(0xfff2f2f2),
                  fontSize: 20,
                ),
              ),

              Text(
                article.publishedAt,
                style: TextStyle(
                  color: Color(0xfff2f2f2),
                  fontSize: 20,
                ),
              ),
            ],),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              child: Text(
                article.description,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  color: Color(0xffbababa)
                ),
              ),
            ),
                    SizedBox(
                      height: 16.0,
                    ),
                    ],
                  ),
                ),
            ],),


            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: double.infinity/2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(0, 0, 0, 0,),Color.fromARGB(135, 0, 0, 0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Stack(

              alignment: Alignment.topLeft,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: FloatingActionButton(onPressed: (){
                    Navigator.of(context).pop();

                  },
                      child: Icon(Icons.arrow_back),

                      backgroundColor: Colors.black.withOpacity(0.5)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}