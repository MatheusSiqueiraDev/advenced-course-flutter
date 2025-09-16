import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/data/services/api/api_client.dart';
import 'package:mvvm/data/services/api/models/todo/todo_api_model.dart';
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
      final CreateTodoApiModel createTodo = CreateTodoApiModel(name: "Funcionou mesmo");
      final Result result = await apiClient.postTodo(createTodo);

      expect(result.asOk.value, isA<Todo>());
    });

    test("Should return Result ok when deleteTodo()", () async {
      final CreateTodoApiModel createTodo = CreateTodoApiModel(name: "Vasco");

      final Result resultTodo = await apiClient.postTodo(createTodo);

      final Result result = await apiClient.deleteTodo(resultTodo.asOk.value);

      expect(result.asOk.value, isA<void>());
    });
    test("Should return Result ok when updateTodo()", () async {
      final CreateTodoApiModel createTodo = CreateTodoApiModel(name: "Vasco nova era");

      final Result resultTodo = await apiClient.postTodo(createTodo);

      final Result result = await apiClient.updateTodo(UpdateTodoApiModel(
        id: resultTodo.asOk.value.id, 
        name: "Vasco 2"
      ));

      expect(result.asOk.value, isA<Todo>());
    });

    test("Should return Result ok when getById()", () async {
      final CreateTodoApiModel createTodo = CreateTodoApiModel(name: "Vasco nova era");

      final Result resultTodo = await apiClient.postTodo(createTodo);

      print(resultTodo.asOk.value.toJson());

      final Result result = await apiClient.getById(resultTodo.asOk.value.id);

      print(result.asOk.value.toJson());

      expect(result.asOk.value, isA<Todo>());

      expect(result.asOk.value.id, resultTodo.asOk.value.id);
    });
  });
}