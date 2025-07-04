import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

void main() {
  group("Should test viewmodel todo", () {
    test("Verifying ViewModel initialState", () {
      final TodoViewmodel todoViewmodel = TodoViewmodel();

      expect(todoViewmodel.todos, isEmpty);
    });

    test("Should add Todo", () async {
      final TodoViewmodel todoViewmodel = TodoViewmodel();

      expect(todoViewmodel.todos, isEmpty);

      await todoViewmodel.addTodo.execute("Novo todo");

      expect(todoViewmodel.todos, isNotEmpty);

      expect(todoViewmodel.todos.first.name, contains("Novo todo"));

      expect(todoViewmodel.todos.first.id, isNotNull);
    });

    test("Should remove Todo", () async {
      final TodoViewmodel todoViewmodel = TodoViewmodel();

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