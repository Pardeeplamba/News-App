import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/pages/articles_details_page.dart';

Widget HomeCard(Article article, BuildContext context) {

    return Card(
      color: Colors.black,
clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(0, 0, 0, 0,),Color.fromARGB(255, 0, 0, 0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Ink.image(image: (article.urlToImage)==null
          ? NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg')
            : NetworkImage(article.urlToImage),
              height: 240,fit: BoxFit.cover,
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticlePage(
                          article: article,
                        )));

              },
            ),
            ),
            Container(

              margin: EdgeInsets.only(left: 15),
              child: Column(

                children: [
                Text(   article.title==null ?
                  " ": article.title,
                  maxLines: 2,

                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),
                ),
                  SizedBox(height: 24,),
                  Row(children: [
                    Text(article.source.name==null ? ""
                      :
                      article.source.name,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12,color: Color(0xffbababa),fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    Text(article.publishedAt==null ? "" : article.publishedAt,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12,color: Color(0xffbababa)),
                    ),
                  ],),
                  SizedBox(height: 12,),



                ],),
            )

          ],
        ),
      ),
    );
  }

