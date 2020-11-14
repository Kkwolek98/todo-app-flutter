import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      theme: CupertinoThemeData(brightness: Brightness.light),
      title: 'Flutter Demo',
      home: TodoListView()
    );
  }
}
