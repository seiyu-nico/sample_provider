class Todo {
  final String title;
  int status;

  Todo({
    required this.title,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'status': status,
    };
  }

  setStatus(status) {
    status = status;
  }

  factory Todo.fromMap(Map<String, dynamic> json) =>
      Todo(title: json['title'], status: json['status']);
}
