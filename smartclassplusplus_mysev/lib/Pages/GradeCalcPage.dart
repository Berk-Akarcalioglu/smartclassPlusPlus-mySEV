import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/GPAPredictor.dart';
import 'package:smartclassplusplus_mysev/Resources/Classes.dart';
import '../Utils/GradeCalc.dart';

class GradeCalcPage extends StatefulWidget {
  @override
  _GradeCalcPageState createState() => _GradeCalcPageState();
}

class _GradeCalcPageState extends State<GradeCalcPage> {
  Classes yearClass = new Classes();
  GPA _gpa = new GPA();

  @override
  Widget build(BuildContext context) {
    _gpa.totalOnlineGrade = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text("Grade Calculator"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30),
                            gradient: RadialGradient(
                              radius: 1.0,
                              colors: <Color>[
                                Theme.of(context).secondaryHeaderColor,
                                Theme.of(context).primaryColor,
                              ],
                              stops: <double>[
                                0.0,
                                2.0,
                              ],
                            ),
                          ),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: GPAPredictor(),
                          )),
                    );
                  });
            },
            icon: Icon(Icons.note_add),
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
              ])),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        //color: Colors.transparent,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Theme.of(context).secondaryHeaderColor,
            Theme.of(context).primaryColor,
          ],
          stops: <double>[0.4, 1.0],
        )),
        child: ListView(
          children: <Widget>[
            //examList(context, yearClass.lessons['tr']),
            //examList(context, yearClass.lessons['math']),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 140,
                  child: StreamBuilder(
                    stream: Firestore.instance.collection('Exams').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      _gpa.totalOnlineCredit = snapshot.data.documents.length.toDouble();
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          _gpa.totalOnlineGrade += convertToUSGrade(snapshot
                              .data.documents[index]['grade']
                              .toDouble());
                          print(_gpa.totalOnlineGrade);
                          return Container(
                            color: Colors.transparent,
                            child: examContainer(
                                context,
                                (snapshot.data.documents[index]['grade'])
                                    .toDouble(),
                                snapshot.data.documents[index]['name'],
                                snapshot.data.documents[index]['lesson']),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Theme.of(context).primaryColor,
                        Theme.of(context).secondaryHeaderColor,
                        Theme.of(context).primaryColor,
                      ],
                      stops: <double>[
                        0.0,
                        0.5,
                        1.0,
                      ],
                    ),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "GPA : ${gpa.gpa(_gpa.totalOnlineCredit.toDouble(), _gpa.totalOnlineGrade)}",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
