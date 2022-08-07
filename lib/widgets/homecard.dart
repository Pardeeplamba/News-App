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

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Ink.image(image: NetworkImage(article.urlToImage),height: 240,fit: BoxFit.cover,
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
                Text(   article.title,
                  maxLines: 2,

                  style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'Robotomono'),
                ),
                  SizedBox(height: 24,),
                  Row(children: [
                    Text(article.source.name,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'RobotoMono'),
                    ),
                    SizedBox(width: 10,),
                    Text(article.publishedAt,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: 'RobotoMono'),
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

