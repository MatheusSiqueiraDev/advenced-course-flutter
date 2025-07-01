import 'package:flutter/material.dart';
import 'package:mvvm/core/command/command.dart';
import 'package:mvvm/core/result/result.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodoViewmodel extends ChangeNotifier {
  TodoViewmodel() {
    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
    removeTodo = Command1(_removeTodo);
  }

  late Command0 load;

  late Command1<Todo, String> addTodo;

  late Command1<String, Todo> removeTodo;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<Result> _load() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Todo> todos = [];

    _todos = todos;

    notifyListeners();

    return Result.ok(todos..add(Todo(id: 1, name: "Primeiro todo")));
  }

  Future<Result<Todo>> _addTodo(String name) async {
    final lastTodoIndex = _todos.length;

    await Future.delayed(const Duration(seconds: 2));

    final createTodo = Todo(id: lastTodoIndex + 1, name: name);

    _todos.add(createTodo);

    notifyListeners();

    return Result.ok(createTodo);
  }

  Future<Result<String>> _removeTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));
    _todos.remove(todo);

    notifyListeners();

    return Result.ok("Removido");
  }
}