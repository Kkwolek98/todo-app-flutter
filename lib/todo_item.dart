import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/service/todo_service.dart';

class TodoItemWidget extends StatefulWidget {
  final TodoItem todo;

  const TodoItemWidget({Key key, this.todo}) : super(key: key);

  TodoItemWidgetState createState() => TodoItemWidgetState();
}

class TodoItemWidgetState extends State<TodoItemWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Padding(
        child: Row(
          children: [
            Column(children: [
              Text(widget.todo.title, style: TextStyle(fontSize: 18)),
              Text(widget.todo.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ], crossAxisAlignment: CrossAxisAlignment.start),
            CupertinoSwitch(
                value: widget.todo.isDone, onChanged: (bool value) {})
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: EdgeInsets.all(18),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 4, blurRadius: 8)
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
    );
  }
}
