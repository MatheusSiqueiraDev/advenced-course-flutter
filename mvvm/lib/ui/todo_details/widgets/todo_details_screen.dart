import 'package:flutter/material.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/ui/todo_details/viewmodels/todo_details_viewmodel.dart';
import 'package:mvvm/ui/todo_details/widgets/todo_name.dart';

class TodoDetailsScreen extends StatefulWidget {
  final TodoDetailsViewmodel todoDetailsViewmodel;

  const TodoDetailsScreen({
    super.key,
    required this.todoDetailsViewmodel
  });

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreen();
}

class _TodoDetailsScreen extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listando detalhe do Todo"),
      ),
      body: ListenableBuilder(
        listenable: widget.todoDetailsViewmodel.load, 
        builder: (BuildContext context, Widget? child) {
          if(widget.todoDetailsViewmodel.load.running) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(widget.todoDetailsViewmodel.load.error) {
            return const Center(
              child: Text('Ocorreu um erro ao carregar o Todo'),
            );
          }

          return child!;
        },
        child: ListenableBuilder(
          listenable: widget.todoDetailsViewmodel, 
          builder: (BuildContext context, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: TodoName(todo: widget.todoDetailsViewmodel.todo),
            );
          },
        ),
      )
    );
  }
}