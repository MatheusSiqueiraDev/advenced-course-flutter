import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/routes/routes.dart';
import 'package:mvvm/utils/typedef/todos.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodoListtile extends StatelessWidget {
  final OnDeleteTodo onDeleteTodo;
  final OnUpdateTodo onUpdateTodo;
  final Todo todo;

  const TodoListtile({
    super.key, 
    required this.todo, 
    required this.onDeleteTodo,
    required this.onUpdateTodo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.todoDetails(todo.id)),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: todo.done, 
            onChanged: (value) {
              onUpdateTodo(todo.copyWith(done: value));
            } 
          ),
          title: Text(todo.name),
          trailing: IconButton(
            onPressed: () {
              onDeleteTodo(todo);
            }, 
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )
          ),
          subtitle: Text(todo.description),
        ),
      ),
    );
  }
}