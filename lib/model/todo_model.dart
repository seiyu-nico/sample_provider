import 'package:flutter/material.dart';

class TodoModel with ChangeNotifier {
  String _inputText = "";
  final List<String> _todos = <String>[];

  List<String> get todos => _todos;

  void addTodo() {
    _todos.add(_inputText);
    notifyListeners();
  }

  String getTodo(int index) {
    return _todos[index];
  }

  void setText(String text) {
    _inputText = text;
  }
}
