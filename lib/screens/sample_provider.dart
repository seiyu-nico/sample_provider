import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sample_provider/model/todo_model.dart';

class SampleProvider extends StatelessWidget {
  const SampleProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Providerを使ったサンプル'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TodoList(),
            ),
            Divider(
              color: Colors.black,
            ),
            TodoInput(),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(color: Colors.black),
      itemCount: Provider.of<TodoModel>(context).todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListTile(index: index);
      },
    );
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todoModel, child) {
        final todo = todoModel.getTodo(index);
        return ListTile(
          title: Text(todo),
        );
      },
    );
  }
}

// Todo入力欄
class TodoInput extends StatelessWidget {
  TodoInput({Key? key}) : super(key: key);
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            onChanged: (text) {
              Provider.of<TodoModel>(context, listen: false).setText(text);
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TodoModel>(context, listen: false).addTodo();
              _controller.clear();
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}
