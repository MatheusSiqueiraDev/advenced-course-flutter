import 'package:flutter/material.dart';
import 'package:mvvm/utils/command/command.dart';
import 'package:mvvm/utils/result/result.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodoViewmodel extends ChangeNotifier {
  TodoViewmodel(
    {required todosRespository }
  ): _todosRespository = todosRespository  {
    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
    removeTodo = Command1(_removeTodo);
  }

  final TodosRepository _todosRespository;

  late Command0 load;

  late Command1<Todo, (String, String, bool)> addTodo;

  late Command1<void, Todo> removeTodo;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<Result> _load() async {
    final result = await _todosRespository.get();

    switch (result) {
      case Ok<List<Todo>>():
        _todos = result.value;
        notifyListeners();
        break;
      case Error():
        // Implement Logs
        break;
    }

    return result; 
  }

  Future<Result<Todo>> _addTodo((String, String, bool) todo) async {
    final (name, description, done) = todo;

    final result = await _todosRespository.add(
      name: name,
      description: description,
      done: done
    );

    switch (result) {
      case Ok<Todo>():
        _todos.add(result.value);
        notifyListeners();
        break;
      case Error():
        // Implement Logs
        break;
    }

    return result;
  }

  Future<Result<void>> _removeTodo(Todo todo) async {
    final result = await _todosRespository.delete(todo);

    switch (result) {
      case Ok<void>():
        _todos.remove(todo);
        notifyListeners();
        break;
      case Error():
        // Implement Logs
        break;
    }

    return result;
  }
}