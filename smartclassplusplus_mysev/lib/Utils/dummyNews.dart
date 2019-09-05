import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget dummyNews(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
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
          borderRadius: BorderRadius.circular(50)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.body2.color,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Text(
              "This is an exmaple message, it could be replaced with virtually anything, I hope that it would be used for good and not for something inapropriate.",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.body2.color,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
