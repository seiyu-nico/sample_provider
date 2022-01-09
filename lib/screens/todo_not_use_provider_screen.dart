import 'package:flutter/material.dart';

import 'package:sample_provider/entities/todo.dart';

class TodoNotUseProviderScreen extends StatefulWidget {
  @override
  _TodoNotUseProviderScreenState createState() =>
      _TodoNotUseProviderScreenState();
}

class _TodoNotUseProviderScreenState extends State {
  List<Todo> todos = [];
  final List<Map<String, dynamic>> _statusList = [
    {'status': 0, 'label': 'Created'},
    {'status': 1, 'label': 'Doing'},
    {'status': 2, 'label': 'Done'},
  ];

  List<DropdownMenuItem<int>> statusList() {
    return _statusList.map((status) {
      return DropdownMenuItem<int>(
        value: status['status'].toInt(),
        child: Text(status['label']),
      );
    }).toList();
  }

  void addTodo({required String title, required int status}) {
    setState(() {
      todos.add(Todo(title: title, status: status));
    });
  }

  void updateStatus({required int index, required int status}) {
    setState(() {
      todos[index].status = status;
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
              child: TodoList(
                key: UniqueKey(),
                todos: todos,
                statusList: statusList,
                updateStatus: updateStatus,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            TodoInput(
              key: UniqueKey(),
              addTodo: addTodo,
              statusList: statusList,
            ),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todos,
    required this.statusList,
    required this.updateStatus,
  }) : super(key: key);
  final List<Todo> todos;
  final Function statusList;
  final Function updateStatus;

  @override
  Widget build(BuildContext context) {
    print('build: TodoList');
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(color: Colors.black),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListTile(
          key: UniqueKey(),
          index: index,
          todo: todos[index],
          statusList: statusList,
          updateStatus: updateStatus,
        );
      },
    );
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    Key? key,
    required this.index,
    required this.todo,
    required this.statusList,
    required this.updateStatus,
  }) : super(key: key);
  final int index;
  final Todo todo;
  final Function statusList;
  final Function updateStatus;

  @override
  Widget build(BuildContext context) {
    print('build: TodoListTile');
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(todo.title),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: DropdownButton<int>(
            value: todo.status,
            items: statusList(),
            onChanged: (status) {
              updateStatus(index: index, status: status);
            },
          ),
        ),
      ],
    );
  }
}

// Todo入力欄
class TodoInput extends StatefulWidget {
  final Function addTodo;
  final Function statusList;
  TodoInput({Key? key, required this.addTodo, required this.statusList})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final TextEditingController _controller = new TextEditingController();
  int selectStatus = 0;

  @override
  Widget build(BuildContext context) {
    print('build: TodoInput');
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'todo ...',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: DropdownButton<int>(
                  value: selectStatus,
                  items: widget.statusList(),
                  onChanged: (status) {
                    setState(() {
                      selectStatus = status != null ? status : 0;
                    });
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              widget.addTodo(title: _controller.text, status: selectStatus);
              _controller.clear();
              setState(() {
                selectStatus = 0;
              });
            },
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}
