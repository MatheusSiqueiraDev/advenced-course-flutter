import 'package:mvvm/utils/result/result.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/domain/models/todo.dart';

class TodosRepositoryDev implements TodosRepository {
  final List<Todo> _todos = [];

  @override
  Future<Result<List<Todo>>> get() async {
    await Future.delayed(const Duration(seconds: 2));

    return Result.ok(_todos);
  }

  @override
  Future<Result<Todo>> add({
    required String name, 
    required String description, 
    required bool done
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    final lastTodoIndex = _todos.length;

    final Todo createTodo = Todo(
      id: (lastTodoIndex + 1).toString(), 
      name: name,
      description: description,
      done: done,
    );

    return Result.ok(createTodo);
  }

  @override
  Future<Result<void>> delete(Todo todo) async {
    await Future.delayed(const Duration(seconds: 2));
    
    if(_todos.contains(todo)) {
      _todos.remove(todo);
    }

    return Result.ok(null);
  }

  @override
  Future<Result<Todo>> getById(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    return Result.ok(_todos.where((todo) => todo.id == id).first);
  }
}