import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/GPAPredictionPage.dart';
import 'package:smartclassplusplus_mysev/Pages/GradeCalcPage.dart';
import 'package:smartclassplusplus_mysev/Utils/Buttons/DrawerButton.dart';
import 'package:smartclassplusplus_mysev/Utils/dummyNews.dart';
import 'package:smartclassplusplus_mysev/Utils/examAddition.dart';
import 'package:smartclassplusplus_mysev/Utils/testButtonsDrawer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Smart Class++'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.library_books,
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          child: ExamAddition(),
                        ),
                      );
                    },
                    
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor,
              ]
              
            )
          ),
        ),
      ),
      drawer: Drawer(
        semanticLabel: 'Grade Calculator',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Theme.of(context).primaryColor,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor,
              ]
              
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              drawerButton(
                  context,
                  "Grade Calculator",
                  Theme.of(context).textTheme.body2,
                  Icons.grade,
                  Theme.of(context).textTheme.body2.color, () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GradeCalcPage()));
              }),
              drawerButton(
                  context,
                  "Grade Predictor",
                  Theme.of(context).textTheme.body2,
                  Icons.grade,
                  Theme.of(context).textTheme.body2.color, () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            GPAPredictionPage()));
              }),
              testbuttonsdrawer(context),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        //color: Theme.of(context).backgroundColor,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).primaryColor,
            ],
            stops: <double>[
              0.4,
              1.0
            ],
            
          )
        ),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 3,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  dummyNews(context, "1"),
                  dummyNews(context, "2"),
                  dummyNews(context, "3")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
