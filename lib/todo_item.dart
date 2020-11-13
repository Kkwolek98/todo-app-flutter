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
        child: Row(children: [
          Column(children: [
            Text(todo.title, style: TextStyle(fontSize: 18)),
            Text(todo.description, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],crossAxisAlignment: CrossAxisAlignment.start)
        ],),
        padding: EdgeInsets.all(18),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 4, blurRadius: 8)
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
    );
  }
}
