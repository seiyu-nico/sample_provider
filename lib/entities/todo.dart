class Todo {
  final String title;

  Todo({
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(title: json['title']);
}
