import 'package:flutter/widgets.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/data/services/api/api_client.dart';
import 'package:mvvm/data/services/api/models/todo/todo_api_model.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/utils/result/result.dart';

class TodosRepositoryRemote extends ChangeNotifier implements TodosRepository {
  final ApiClient _apiClient;

  TodosRepositoryRemote({required ApiClient apiClient}) : _apiClient = apiClient;

  List<Todo> _todos = [];

  final Map<String, Todo> _cacheTodos = {};

  @override 
  List<Todo> get todos => _todos;

  @override
  Future<Result<Todo>> add({
    required String name, 
    required String description, 
    required bool done
  }) async {
    try {
      final Result<Todo> result = await _apiClient.postTodo(
        CreateTodoApiModel(
          name: name, 
          description: description,
          done: false
        )
      );

      switch (result) {
        case Ok<Todo>():
          _cacheTodos[result.value.id] = result.value;
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> delete(Todo todo) async{
    try {
      todo.name;
      final Result result = await _apiClient.deleteTodo(todo);

      switch (result) {
        case Ok<void>():
          _cacheTodos.remove(todo.id);
          return Result.ok(null);
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<List<Todo>>> get() async {
    try {
      final Result<List<Todo>> result = await _apiClient.getTodos();

      switch (result) {
        case Ok<List<Todo>>():
          _todos = result.value;
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }
  
  @override
  Future<Result<Todo>> getById(String id) async {
    if(_cacheTodos[id] != null) {
      return Result.ok(_cacheTodos[id]!);
    }
    
    try {
      final Result<Todo> result = await _apiClient.getById(id);

      switch (result) {
        case Ok<Todo>():
          _cacheTodos[id] = result.value;
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    } 
  }

  @override
  Future<Result<Todo>> update(Todo todo) async {
    try {
      final Result<Todo> result = await _apiClient.updateTodo(
        UpdateTodoApiModel(
          id: todo.id, 
          name: todo.name, 
          description: todo.description, 
          done: todo.done
        )
      );

      switch (result) {
        case Ok<Todo>():
          final int index = _todos.indexWhere((t) => t.id == todo.id);
          _cacheTodos[todo.id] = result.value;
          _todos[index] = result.value;
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }
}