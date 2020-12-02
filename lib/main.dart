import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'articles.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
    home:Home()
    ));

}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  
  var typeNews = "School";

  void updateTypeNews(typeNewsNew){
    setState(() {
      typeNews = typeNewsNew;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    var colors = {"School":Colors.blue,"Coding Club":Colors.orange,"Math Club":Colors.green,"Robotics":Colors.red};
    return Scaffold(
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
          height: 90.0,
          child:DrawerHeader(
            child: RichText(
            text: TextSpan(
                    style:TextStyle(fontSize: 40),
                    text: "STR",
                    children: <TextSpan>[
                      TextSpan(text: "App ",style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                ),
                ),
              decoration: BoxDecoration(
                color: colors[typeNews],
              ),
            ),
          ),
          ListTile(title: Row(children: [Icon(Icons.public,size: 40,color: Colors.blue,),SizedBox(width: 10),Text("School",style: TextStyle(fontSize: 20),)],) ,onTap:(){updateTypeNews("School");Navigator.pop(context);},),
          ListTile(title: Row(children: [Icon(Icons.tv,size: 40,color: Colors.orange,),SizedBox(width: 10),Text("Coding Club",style: TextStyle(fontSize: 20),)],),onTap:(){updateTypeNews("Coding Club");Navigator.pop(context);}),
          ListTile(title: Row(children: [Icon(Icons.add,size: 40,color: Colors.green,),SizedBox(width: 10),Text("Math Club",style: TextStyle(fontSize: 20),)],), onTap:(){updateTypeNews("Math Club");Navigator.pop(context);}),
          ListTile(title: Row(children: [Icon(Icons.android,size: 40,color: Colors.red,),SizedBox(width: 10),Text("Robotics",style: TextStyle(fontSize: 20),)],), onTap:(){updateTypeNews("Robotics");Navigator.pop(context);}),
          
      ]

      ),
    ),
    backgroundColor: colors[typeNews],
    appBar: AppBar(
      title:RichText(
        text: TextSpan(
          text: "STR",
          children: <TextSpan>[
            TextSpan(text: "App ",style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: typeNews)
          ],
      ),
      ),
      centerTitle: true, 
      backgroundColor: colors[typeNews],
      elevation: 0,
    ),

    body: 
    StreamBuilder(
      stream:Firestore.instance.collection(typeNews).snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(child:Text("Loading"));
        }
        return ListView(
        children: 
        snapshot.data.documents.map<Widget>((DocumentSnapshot document) {
        //Maybe add firestore collection name
        return ArticleCard(Article(title: document.data['title'],imgLnk:document.data['imglink'],date: document.data['date'],corp:document.data['corp'],articleTxt:document.data['body'],));
          }
        ).toList(),
        );
      }
      ),

    );
}
}