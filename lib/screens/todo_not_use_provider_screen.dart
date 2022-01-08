import 'package:flutter/material.dart';

import 'package:sample_provider/entities/todo.dart';

class TodoNotUseProviderScreen extends StatefulWidget {
  @override
  _TodoNotUseProviderScreenState createState() =>
      _TodoNotUseProviderScreenState();
}

class _TodoNotUseProviderScreenState extends State {
  List<Todo> todos = [];

  void addTodo(String title) {
    setState(() {
      todos.add(Todo(title: title));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build: _TodoNotUseProviderScreenState');
    return Scaffold(
      appBar: AppBar(
        title: Text('Providerを使わないサンプル'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TodoList(key: UniqueKey(), todos: todos),
            ),
            Divider(
              color: Colors.black,
            ),
            TodoInput(addTodo: addTodo),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.todos}) : super(key: key);
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    print('build: TodoList');
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(color: Colors.black),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListTile(key: UniqueKey(), todo: todos[index]);
      },
    );
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    print('build: TodoListTile');
    return ListTile(
      title: Text(todo.title),
    );
  }
}

// Todo入力欄
class TodoInput extends StatelessWidget {
  TodoInput({Key? key, required this.addTodo}) : super(key: key);
  final Function(String) addTodo;
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build: TodoInput');
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'todo ...',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addTodo(_controller.text);
              _controller.clear();
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}
