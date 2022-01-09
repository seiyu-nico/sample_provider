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
    return Consumer<TodoModel>(
      builder: (context, todoModel, child) {
        final todo = todoModel.getTodo(index);
        return ListTile(
          title: Text(todo.title),
        );
      },
    );
  }
}

// Todo入力欄
class TodoInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
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
              Provider.of<TodoModel>(context, listen: false)
                  .addTodo(text: _controller.text);
              _controller.clear();
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}
