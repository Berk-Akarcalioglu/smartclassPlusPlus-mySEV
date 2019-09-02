import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/GPAPredictionPage.dart';
import 'package:smartclassplusplus_mysev/Pages/GradeCalcPage.dart';
import 'package:smartclassplusplus_mysev/Utils/Buttons/DrawerButton.dart';
import 'package:smartclassplusplus_mysev/Utils/dummyNews.dart';
import 'package:smartclassplusplus_mysev/Utils/testButtonsDrawer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Smart Class Plus Plus'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.library_books,
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                ), 
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                ), 
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        semanticLabel: 'Grade Calculator',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.orangeAccent,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              drawerButton(context, "Grade Calculator", Icons.grade, Colors.white, Colors.black, (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => GradeCalcPage()
                ));
              }),
              drawerButton(context, "Grade Predictor", Icons.grade, Colors.white, Colors.black, (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => GPAPredictionPage()
                ));
              }),
              testbuttonsdrawer(context),
            ],
          ),
        ),
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              dummyNews(context, "1"),
              dummyNews(context, "2")
            ],
          ),
      ),
    );
  }
}