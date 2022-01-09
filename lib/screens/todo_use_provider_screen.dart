import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sample_provider/models/todo_model.dart';

class TodoUseProviderScreen extends StatelessWidget {
  const TodoUseProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build: TodoUseProviderScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text('Providerを使ったサンプル'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TodoList(
                key: UniqueKey(),
              ),
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
    print('build: TodoList');
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(color: Colors.black),
      itemCount: Provider.of<TodoModel>(context).todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListTile(key: UniqueKey(), index: index);
      },
    );
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    print('build: TodoListTile');
    final list = Provider.of<TodoModel>(context).statusList;
    List<DropdownMenuItem<int>> items = list.map((status) {
      return DropdownMenuItem<int>(
        value: status['status'],
        child: Text(status['label']),
      );
    }).toList();

    return Consumer<TodoModel>(
      builder: (context, todoModel, child) {
        final todo = todoModel.getTodo(index);
        return Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(todo.title),
              ),
            ),
            DropdownButton<int>(
              value: todo.status,
              items: items,
              onChanged: (status) {
                status = status != null ? status : 0;
                Provider.of<TodoModel>(context, listen: false)
                    .updateStatus(index: index, status: status);
              },
            ),
          ],
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
            onChanged: (text) {
              Provider.of<TodoModel>(context, listen: false)
                  .setText(text: text);
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
