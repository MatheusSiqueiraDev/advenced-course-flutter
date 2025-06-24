import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/todo_listtile.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  const TodosList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    if(todos.isEmpty) {
      return const Center(
        child: Text("Nenhuma tarefa por enquanto..."),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoListtile(todo: todos[index]);
      } 
    );
  }
}