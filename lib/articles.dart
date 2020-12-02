import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';


class Article{
  String title, corp, date, author, imgLnk;
  List articleTxt; 

  Article({this.title,this.corp,this.date,this.author,this.articleTxt,this.imgLnk});

}

class ArticleCard extends StatelessWidget {
  final Article art;
  const ArticleCard(this.art);


  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            color: Color(0xfff4f4f4),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
            child:Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child:
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
            Image.network(
                art.imgLnk,
            ),
            //fit: BoxFit.fill,
  
            
            ExpansionCard(
              borderRadius:10,
              margin: EdgeInsets.all(0),
              title:Column(
              children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child:
                Text(art.title,
                  style: TextStyle(
                    fontSize: 24, 
                    fontFamily: 'NewsCycle',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1a1c20)
                  ),
                ),
              ),
              

              Align(
                alignment: Alignment.bottomLeft,
                child: Text(art.corp,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1a1c20) 
                  ),
                textAlign: TextAlign.left,
                ),
              ),
              
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(art.date,
                style: TextStyle(
                  fontSize: 20, 
                  color: Color(0xff1a1c20) 

                ),
                textAlign: TextAlign.left,
                ),
              ),
              ]
              
            ),
            children: art.articleTxt.map((item)=>
            Align(
            alignment: Alignment.bottomLeft,
            child:
            Text(
              "\n"+item,
              style: TextStyle(fontStyle:FontStyle.italic,fontSize: 18,),
            )
            )
            ).toList()
              
            )
            ])
          )
      );
  }
}
