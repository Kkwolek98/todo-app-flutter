import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/service/todo_service.dart';
import 'package:todo_list/shared/title.dart';
import 'package:todo_list/todo_item.dart';

class TodoListView extends StatefulWidget {
  TodoListViewState createState() => TodoListViewState();
}

class TodoListViewState extends State<TodoListView> {
  List<TodoItem> _todoList = List<TodoItem>();

  @override
  void initState() {
    super.initState();
    _fetchTodoList();
  }

  void _fetchTodoList() {
    TodoService.getTodoList().then((todoList) => {
          print(todoList),
          setState(() => {_todoList = todoList})
        });
  }

  Future<bool> _handleDeleteDialog() async {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Delete this todo item?"),
            content: Text("Do you really want to delete this todo item?"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text("Delete"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
                )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppTitle("Todo list"),
          preferredSize: const Size((double.infinity), kToolbarHeight + 40),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onLongPress: () {
                _handleDeleteDialog().then((value) => {
                  
                });
              },
              child: new TodoItemWidget(todo: _todoList[index]),
            );
          },
          itemCount: _todoList.length,
        ));
  }
}
