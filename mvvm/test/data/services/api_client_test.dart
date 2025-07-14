import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/data/services/api/api_client.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/utils/result/result.dart';

void main() {
  late ApiClient apiClient;

  setUp(() {
    apiClient = ApiClient();
  });

  group("Should test [ApiClient]", () {
    test("Should return Result ok when getTodos()", () async {
      final Result result = await apiClient.getTodos();

      expect(result.asOk.value, isA<List<Todo>>());
    });

    test("Should return Result ok when postTodo()", () async {
      final Todo createTodo = Todo(name: "Funcionou mesmo");
      final Result result = await apiClient.postTodo(createTodo);

      expect(result.asOk.value, isA<Todo>());
    });

    test("Should return Result ok when deleteTodo()", () async {
      final Todo createTodo = Todo(name: "Vasco");

      final Result resultTodo = await apiClient.postTodo(createTodo);

      final Result result = await apiClient.deleteTodo(resultTodo.asOk.value);

      expect(result.asOk.value, isA<void>());
    });
  });
}