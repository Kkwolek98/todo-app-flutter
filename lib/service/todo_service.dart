import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoService {
  static final String apiUrl = "http://192.168.0.179:8000/api";

  static Future<List<TodoItem>> getTodoList() async {
    final response = await http.get(apiUrl + "/todos");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(utf8.decode(response.bodyBytes))
          .cast<Map<String, dynamic>>();
      return parsed.map<TodoItem>((json) => TodoItem.fromJson(json)).toList();
    } else {
      throw Exception("Could not fetch TodoItems");
    }
  }

  static Future<bool> toggleTodoDone(int id) async {
    final response =
        await http.put(apiUrl + "/todo/toggle_done/" + id.toString());
    if (response.statusCode == 200) {
      final parsed = jsonDecode(utf8.decode(response.bodyBytes));
      return TodoItem.fromJson(parsed).isDone;
    } else {
      throw Exception("Could not toggle isDone");
    }
  }

  static Future<bool> deleteTodo(int id) async {
    final response = await http.delete(apiUrl + "/todo/" + id.toString());
    return response.statusCode == 200;
  }

  static Future<bool> addTodo(String title) async {
    final response = await http.post(apiUrl + "/todo", body: jsonEncode(<String, String>{
      'title': title
    }));
    return response.statusCode == 200;
  }
}

class TodoItem {
  int id;
  String description;
  String title;
  bool isDone;

  TodoItem({this.id, this.description, this.title, this.isDone});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
        id: json['ID'],
        description: json['description'],
        title: json['title'],
        isDone: json['isDone']);
  }
}
