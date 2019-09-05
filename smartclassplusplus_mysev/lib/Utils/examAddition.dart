import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartclassplusplus_mysev/Utils/addExam.dart';

class ExamAddition extends StatefulWidget {
  @override
  _ExamAdditionState createState() => _ExamAdditionState();
}

class _ExamAdditionState extends State<ExamAddition> {
  @override
  Widget build(BuildContext context) {
    final nameCont = new TextEditingController();
    final gradeCont = new TextEditingController();

    String lessonValue = "Math";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              controller: nameCont,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: Theme.of(context).textTheme.body2,
                hasFloatingPlaceholder: true,
              ),
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              controller: gradeCont,
              inputFormatters: [
                BlacklistingTextInputFormatter(RegExp("[a-z]")),
                BlacklistingTextInputFormatter(RegExp("[A-Z]")),
              ],
              decoration: InputDecoration(
                hintText: "Grade",
                hintStyle: Theme.of(context).textTheme.body2,
                hasFloatingPlaceholder: true,
              ),
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          new DropdownButtonFormField(
            value: lessonValue,
            onChanged: (String newValue) {
              setState(() {
                lessonValue = newValue;
              });
            },
            items: <String>['Turkish', 'Math', 'Science', 'English']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.transparent,
            onPressed: () {
              setState(() {
                addExam(
                    nameCont.text, double.parse(gradeCont.text), lessonValue);
                Navigator.pop(context);
              });
            },
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
                "Save",
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
