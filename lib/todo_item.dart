import 'package:flutter/material.dart';
import 'package:todo_list/service/todo_service.dart';

class TodoItemWidget extends StatelessWidget {
  TodoItem todo;

  TodoItemWidget(this.todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Padding(
        child: Text(todo.title, style: TextStyle(fontSize: 18)),
        padding: EdgeInsets.all(18),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 4, blurRadius: 8)
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
    );
  }
}
