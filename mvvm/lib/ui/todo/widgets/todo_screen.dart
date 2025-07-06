import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/add_todo_widget.dart';
import 'package:mvvm/ui/todo/widgets/todos_list.dart';

class TodoScreen extends StatefulWidget {
  final TodoViewmodel todoViewmodel;

  const TodoScreen({
    super.key,  
    required this.todoViewmodel
  });

  @override
  State<TodoScreen> createState() => _TodoScreen();
}

class _TodoScreen extends State<TodoScreen> {
   @override
  void initState() {
    widget.todoViewmodel.removeTodo.addListener(_removeCallBack);
    super.initState();
  }

  void _removeCallBack() {
    if(widget.todoViewmodel.removeTodo.running) {
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: IntrinsicHeight(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      );
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      if(widget.todoViewmodel.removeTodo.completed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Todo removido com sucesso"),
          )
        );
      } 

      if(widget.todoViewmodel.removeTodo.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Ocorreu erro ao remover o todo")
          )
        );
      }
    }
  }

  @override
  void dispose() {
    widget.todoViewmodel.removeTodo.removeListener(_removeCallBack);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos screen'),
      ),
      body: ListenableBuilder(
        listenable: widget.todoViewmodel.load, 
        builder: (context, child) {
          if(widget.todoViewmodel.load.running) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(widget.todoViewmodel.load.error) {
            return const Center(
              child: Text("Ocorreu um erro ao carregar todos..."),
            );
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: widget.todoViewmodel, 
          builder: (context, build) {
            return TodosList(
              todos: widget.todoViewmodel.todos,
              onDeleteTodo: (todo) {
                widget.todoViewmodel.removeTodo.execute(todo);
              }
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AddTodoWidget(
                todoViewmodel: widget.todoViewmodel,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}