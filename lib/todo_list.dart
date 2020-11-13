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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppTitle("Todo list"),
          preferredSize: const Size((double.infinity), kToolbarHeight + 40),
        ),
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return new TodoItemWidget(todo: _todoList[index]);
        },
        itemCount: _todoList.length,
        )
      );
  }
}
