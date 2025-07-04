import 'package:mvvm/core/result/result.dart';
import 'package:mvvm/domain/models/todo.dart';

abstract class TodosRespository {
  Future<Result<List<Todo>>> get();

  Future<Result<Todo>> add(String name);

  Future<Result<void>> delete(Todo todo);
}