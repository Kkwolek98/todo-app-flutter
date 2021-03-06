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

  void _handleDoneToggle() {
    TodoService.toggleTodoDone(widget.todo.id).then((isDone) => {
          setState(() {
            widget.todo.isDone = isDone;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Padding(
        child: Row(
          children: [
            Column(children: [
              Text(widget.todo.title, style: TextStyle(fontSize: 18, decoration: widget.todo.isDone ? TextDecoration.lineThrough : null)),
              Text(widget.todo.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ], crossAxisAlignment: CrossAxisAlignment.start),
            CupertinoSwitch(
                value: widget.todo.isDone,
                onChanged: (bool value) {
                  setState(() {
                    widget.todo.isDone = !widget.todo.isDone;
                  });
                  _handleDoneToggle();
                })
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: EdgeInsets.all(18),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 4, blurRadius: 8)
      ], borderRadius: BorderRadius.circular(20), color: widget.todo.isDone ? Colors.black12 : Colors.white),
    );
  }
}
