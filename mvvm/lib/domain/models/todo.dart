class Todo {
  final String? id;
  final String name;

  Todo({
    this.id, 
    required this.name
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"], 
      name: json["name"]
    );
  }
}