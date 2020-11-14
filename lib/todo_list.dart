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
  TextEditingController _todoTextController;

  @override
  void initState() {
    super.initState();
    _fetchTodoList();
    _todoTextController = TextEditingController(text: '');
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

  void _handleAddNewTodo() {
    if(_todoTextController.text.isNotEmpty) {
    TodoService.addTodo(_todoTextController.text).then((isAdded) => {
          if (isAdded) {
            _fetchTodoList(),
            _todoTextController.clear()
            }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppTitle("Todo list"),
          preferredSize: const Size((double.infinity), kToolbarHeight + 40),
        ),
        body: Stack(children: [
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onLongPress: () {
                  _handleDeleteDialog().then((value) => {
                        if (value)
                          {
                            TodoService.deleteTodo(_todoList[index].id)
                                .then((isDeleted) => {
                                      if (isDeleted) {_fetchTodoList()}
                                    })
                          }
                      });
                },
                child: new TodoItemWidget(todo: _todoList[index]),
              );
            },
            itemCount: _todoList.length,
          ),
          Align(
            child: CupertinoTextField(
              suffix: IconButton(
                icon: Icon(
                  CupertinoIcons.add_circled,
                  color: CupertinoColors.activeGreen,
                ),
                onPressed: () {
                  _handleAddNewTodo();
                },
              ),
              controller: _todoTextController,
              padding: EdgeInsets.all(12.0),
              placeholder: "New todo...",
            ),
            alignment: Alignment.bottomLeft,
          )
        ]));
  }
}
