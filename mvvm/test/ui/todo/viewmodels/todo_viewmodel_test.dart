import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/data/repositories/todos/todos_repository_dev.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

void main() {
  late TodoViewmodel todoViewmodel;
  late TodosRespository todosRespository;

  setUp(() {
    todosRespository = TodosRepositoryDev();
    todoViewmodel = TodoViewmodel(
      todosRespository: todosRespository
    );
  });

  group("Should test viewmodel todo", () {
    test("Verifying ViewModel initialState", () {
      expect(todoViewmodel.todos, isEmpty);
    });

    test("Should add Todo", () async {
      expect(todoViewmodel.todos, isEmpty);

      await todoViewmodel.addTodo.execute("Novo todo");

      expect(todoViewmodel.todos, isNotEmpty);

      expect(todoViewmodel.todos.first.name, contains("Novo todo"));

      expect(todoViewmodel.todos.first.id, isNotNull);
    });

    test("Should remove Todo", () async {
      expect(todoViewmodel.todos, isEmpty);

      await todoViewmodel.addTodo.execute("Novo todo");

      expect(todoViewmodel.todos, isNotEmpty);

      expect(todoViewmodel.todos.first.name, contains("Novo todo"));

      expect(todoViewmodel.todos.first.id, isNotNull);

      await todoViewmodel.removeTodo.execute(todoViewmodel.todos.first);

      expect(todoViewmodel.todos, isEmpty);
    });
  });
}