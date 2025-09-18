import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodoName extends StatelessWidget {
  const TodoName({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Text(
        todo.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
      ),
    );
  }
}