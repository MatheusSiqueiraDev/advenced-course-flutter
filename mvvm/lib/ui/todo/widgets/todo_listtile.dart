import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodoListtile extends StatelessWidget {
  final Todo todo;

  const TodoListtile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(todo.id.toString()),
      title: Text(todo.name)
    );
  }
}