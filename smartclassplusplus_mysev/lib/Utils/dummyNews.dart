import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget dummyNews(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.lime,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Text(
              title
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Text(
              "This is an exmaple message, it could be replaced with virtually anything, I hope that it would be used for good and not for something inapropriate.",
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
