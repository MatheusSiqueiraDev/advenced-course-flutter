import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/utils/typedef/todos.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/ui/todo/widgets/todo_listtile.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  final OnDeleteTodo onDeleteTodo;
  final OnUpdateTodo onUpdateTodo;

  const TodosList({
    super.key, 
    required this.todos, 
    required this.onDeleteTodo,
    required this.onUpdateTodo
  });

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
        return TodoListtile(
          todo: todos[index],
          onDeleteTodo: onDeleteTodo,
          onUpdateTodo: onUpdateTodo,
        );
      } 
    );
  }
}