import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  String title;

  AppTitle(title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, 
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 6, blurRadius: 12)
          ], borderRadius: BorderRadius.circular(40), color: Colors.white),
          child: Padding(
            child: Text("$title",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24)
          ),
        ),
    );
  }
}
