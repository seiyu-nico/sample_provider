import 'package:flutter/material.dart';

import 'package:sample_provider/entities/todo.dart';

class TodoModel with ChangeNotifier {
  final List<Todo> _todos = [];
  final List<Map<String, dynamic>> _statusList = [
    {'status': 0, 'label': 'Created'},
    {'status': 1, 'label': 'Doing'},
    {'status': 2, 'label': 'Done'},
  ];

  List<Todo> get todos => _todos;

  List<DropdownMenuItem<int>> statusList() {
    return _statusList.map((status) {
      return DropdownMenuItem<int>(
        value: status['status'].toInt(),
        child: Text(status['label']),
      );
    }).toList();
  }

  void addTodo({String text = '', int status = 0}) {
    _todos.add(Todo(title: text, status: status));
    notifyListeners();
  }

  Todo getTodo(int index) {
    return _todos[index];
  }

  void updateStatus({required int index, required int status}) {
    _todos[index].status = status;
    notifyListeners();
  }
}
