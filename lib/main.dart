import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/shared/title.dart';
import 'package:todo_list/todo_list.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: TodoListView()
    );
  }
}
