import 'package:flutter/material.dart';

import 'package:sample_provider/entities/todo.dart';

class TodoModel with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo({String text = ''}) {
    _todos.add(Todo(title: text));
    notifyListeners();
  }

  Todo getTodo(int index) {
    return _todos[index];
  }
}
