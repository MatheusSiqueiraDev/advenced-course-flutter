class Todo {
  final String id;
  final String name;

  const Todo({
    required this.id, 
    required this.name
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"], 
      name: json["name"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }
}