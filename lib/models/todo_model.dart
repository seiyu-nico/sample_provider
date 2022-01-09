import 'package:flutter/material.dart';

import 'package:sample_provider/entities/todo.dart';

class TodoModel with ChangeNotifier {
  String _inputText = "";
  int _selectStatus = 0;
  final List<Todo> _todos = [];
  final List<Map<String, dynamic>> _statusList = [
    {'status': 0, 'label': 'Created'},
    {'status': 1, 'label': 'Doing'},
    {'status': 2, 'label': 'Done'},
  ];

  List<Todo> get todos => _todos;
  List<Map> get statusList => _statusList;

  void addTodo() {
    _todos.add(Todo(title: _inputText, status: _selectStatus));
    setText();
    notifyListeners();
  }

  Todo getTodo(int index) {
    return _todos[index];
  }

  void setText({String text = ''}) {
    _inputText = text;
  }

  void updateStatus({required int index, required int status}) {
    _todos[index].status = status;
    notifyListeners();
  }
}
