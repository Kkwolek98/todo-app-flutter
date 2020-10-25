import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoService {
  static final String apiUrl = "http://192.168.0.179:8000/api";

  static Future<List<TodoItem>> getTodoList() async {
    final response = await http.get(apiUrl + "/todos");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<TodoItem>((json)=>TodoItem.fromJson(json)).toList();
    } else {
      throw Exception("Could not fetch TodoItems");
    }
  }
}

class TodoItem {
  final int id;
  final String description;
  final String title;
  final bool isDone;

  TodoItem({this.id, this.description, this.title, this.isDone});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
        id: json['ID'],
        description: json['description'],
        title: json['title'],
        isDone: json['isDone']);
  }
}
