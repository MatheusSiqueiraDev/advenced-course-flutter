import 'package:flutter/material.dart';
import 'package:mvvm/utils/typedef/todos.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodoListtile extends StatefulWidget {
  final OnDeleteTodo onDeleteTodo;
  final Todo todo;

  const TodoListtile({
    super.key, 
    required this.todo, 
    required this.onDeleteTodo
  });

  @override
  State<TodoListtile> createState() => _TodoListtile();
}

class _TodoListtile extends State<TodoListtile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.todo.id.toString()),
      title: Text(widget.todo.name),
      trailing: IconButton(
        onPressed: () {
          widget.onDeleteTodo(widget.todo);
        }, 
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        )
      ),
    );
  }
}