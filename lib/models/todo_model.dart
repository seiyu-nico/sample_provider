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
  int get selectStatus => _selectStatus;

  List<DropdownMenuItem<int>> statusList() {
    return _statusList.map((status) {
      return DropdownMenuItem<int>(
        value: status['status'],
        child: Text(status['label']),
      );
    }).toList();
  }

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

  void setSelectStatus({required int status}) {
    _selectStatus = status;
    notifyListeners();
  }

  void updateStatus({required int index, required int status}) {
    _todos[index].status = status;
    notifyListeners();
  }
}
