import 'dart:convert';
import 'dart:io';
import 'package:mvvm/data/services/api/models/todo/todo_api_model.dart';
import 'package:mvvm/domain/models/todo.dart';
import 'package:mvvm/utils/result/result.dart';

class ApiClient {
  ApiClient({
    String? host, 
    int? port,
    HttpClient Function()? clientFactory
  }): _host = host ?? 'localhost', _port = port ?? 3000, _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  Future<Result<List<Todo>>> getTodos() async {
    final client = _clientFactory();

    try {
      final request = await client.get(_host, _port, "/todos");

      final response = await request.close();

      if(response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();

        final json = jsonDecode(stringData) as List;

        final List<Todo> todos = json.cast<Map<String, dynamic>>().map(Todo.fromJson).toList();

        return Result.ok(todos);
      } else {
        return Result.error(const HttpException("Impossível buscar os todos"));
      }
    } on Exception catch(error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Todo>> postTodo(CreateTodoApiModel todo) async {
    final client = _clientFactory();

    try {
      final request = await client.post(_host, _port, "/todos");

      request.write(jsonEncode(todo.toJson()));

      final response = await request.close();

      if(response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();

        final json = jsonDecode(stringData) as Map<String, dynamic>;

        final createTodo = Todo.fromJson(json);

        return Result.ok(createTodo);
      }
        
      return Result.error(const HttpException("Valor invalidado"));
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
  Future<Result<Todo>> updateTodo(UpdateTodoApiModel todo) async {
    final client = _clientFactory();

    try {
      final request = await client.put(_host, _port, "/todos/${todo.id}");

      request.write(jsonEncode(todo.toJson()));

      final response = await request.close();

      if(response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();

        final json = jsonDecode(stringData) as Map<String, dynamic>;

        final updateTodo = Todo.fromJson(json);

        return Result.ok(updateTodo);
      }
        
      return Result.error(const HttpException("Valor invalidado"));
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> deleteTodo(Todo todo) async {
    final client = _clientFactory();

    try {
      final request = await client.delete(_host, _port, "/todos/${todo.id}");

      final response = await request.close();

      if(response.statusCode == 200) {
        return Result.ok(null);
      }

      return Result.error(const HttpException("Nao foi possivel remover todo"));
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Todo>> getById(String id) async {
    final client = _clientFactory();

    try {
      final request = await client.get(_host, _port, "/todos/$id");

      final response = await request.close();

      if(response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();

        final json = jsonDecode(stringData) as Map<String, dynamic>;

        final createTodo = Todo.fromJson(json);

        return Result.ok(createTodo);
      }

      return Result.error(const HttpException("Não foi possível buscar o todo"));
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}