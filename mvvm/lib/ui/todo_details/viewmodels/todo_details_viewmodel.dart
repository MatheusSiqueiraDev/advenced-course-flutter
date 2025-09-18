import 'package:flutter/widgets.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/utils/command/command.dart';
import 'package:mvvm/utils/result/result.dart';

class TodoDetailsViewmodel extends ChangeNotifier {
  TodoDetailsViewmodel({
    required todosRespository
  } ): _todosRespository = todosRespository {
    load = Command1(_load);
  }

  final TodosRepository _todosRespository;

  late final Command1<Todo, String> load; 

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