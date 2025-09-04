import 'package:mvvm/data/services/api/models/todo/todo_api_model.dart';

void main() {
  const TodoApiModel todoApiModel =  TodoApiModel.create(name: 'Teste');

  print(todoApiModel.toJson());

  const todoCreate = CreateTodoApiModel(name: 'Teste2');

  print(todoCreate.toJson());

  const UpdateTodoApiModel updateTodoApiModel = UpdateTodoApiModel(id: "teste", name: "Update name");

  print(updateTodoApiModel.toJson());
}