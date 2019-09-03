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

  @override
  Widget build(BuildContext context) {
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
                        height: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: GPAPredictor()),
                      ),
                    );
                  });
            },
            icon: Icon(Icons.note_add),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: ListView(
          children: <Widget>[
            examList(context, yearClass.lessons['tr']),
            examList(context, yearClass.lessons['math']),
            Container(
              alignment: Alignment.center,
              child: Text(
                  "GPA : ${gpa.gpa(gpa.getTotalCredit(yearClass.lessons), gpa.getTotalGrade(yearClass.lessons)).floorToDouble()}"),
            ),
            Container(
              height: 500,
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: Firestore.instance.collection('Classes').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        Container(
                            color: Colors.amber,
                            child: Text(snapshot.data.documents[index]['name']
                                .toString())),
                        Container(
                          height: 50,
                          color: Colors.lightBlue,
                          child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('Exams')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot2) {
                              return ListView.builder(
                                itemCount: snapshot2.data.documents.length,
                                itemBuilder:
                                    (BuildContext context, int index2) {
                                  return Container(
                                    color: Colors.amber,
                                    child: Text(snapshot2
                                        .data.documents[index2]['name']
                                        .toString()),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          color: Colors.lightBlue,
                          child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('Exams')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot2) {
                              return ListView.builder(
                                itemCount: snapshot2.data.documents.length,
                                itemBuilder:
                                    (BuildContext context, int index2) {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.amber,
                                        child: Text(snapshot2
                                            .data.documents[index2]['grade']
                                            .toString()),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: examContainer(
                                            context,
                                            (snapshot2.data.documents[index2]
                                                ['grade']).toDouble(),
                                            snapshot2.data.documents[index2]
                                                ['name'], snapshot.data.documents[index]['name']),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
