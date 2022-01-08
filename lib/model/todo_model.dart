import 'package:flutter/material.dart';

import 'package:sample_provider/entities/todo.dart';

class TodoModel with ChangeNotifier {
  String _inputText = "";
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo() {
    _todos.add(Todo(title: _inputText));
    setText();
    notifyListeners();
  }

  Todo getTodo(int index) {
    return _todos[index];
  }

  void setText({String text = ''}) {
    _inputText = text;
  }
}
