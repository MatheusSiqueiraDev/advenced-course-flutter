import 'package:flutter/widgets.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/domain/use_case/todo_update_use_case.dart';
import 'package:mvvm/utils/command/command.dart';
import 'package:mvvm/utils/result/result.dart';

class TodoDetailsViewmodel extends ChangeNotifier {
  TodoDetailsViewmodel({
    required todosRespository,
    required todoUpdateUseCase
  } ): _todosRespository = todosRespository, _todoUpdateUseCase = todoUpdateUseCase {
    load = Command1(_load);
    updateTodo = Command1(_todoUpdateUseCase.updateTodo);
    _todosRespository.addListener(() {
      load.execute(_todo.id);
    });
  }

  final TodoUpdateUseCase _todoUpdateUseCase;

  final TodosRepository _todosRespository;

  late final Command1<Todo, String> load; 

  late final Command1<Todo, Todo> updateTodo;

  late Todo _todo;

  Todo get todo => _todo;

  Future<Result<Todo>> _load(String id) async {
    try {
      final Result<Todo> result = await _todosRespository.getById(id);

      switch (result) {
        case Ok<Todo>():
          _todo = result.value;
          return result;
        default:
          return result;
      }
    } on Exception catch(error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }    
  }
}