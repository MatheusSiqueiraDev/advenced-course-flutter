import 'package:go_router/go_router.dart';
import 'package:mvvm/data/repositories/todos/todos_repository.dart';
import 'package:mvvm/data/repositories/todos/todos_repository_remote.dart';
import 'package:mvvm/data/services/api/api_client.dart';
import 'package:mvvm/domain/use_case/todo_update_use_case.dart';
import 'package:mvvm/routes/routes.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/todo_screen.dart';
import 'package:mvvm/ui/todo_details/viewmodels/todo_details_viewmodel.dart';
import 'package:mvvm/ui/todo_details/widgets/todo_details_screen.dart';

GoRouter routerConfig() {
  TodosRepository todosRepository = TodosRepositoryRemote(
    apiClient: ApiClient(
      host: "10.0.0.195"
    )
  );

  TodoUpdateUseCase todoUpdateUseCase = TodoUpdateUseCase(
    todosRepository: todosRepository
  );

  return GoRouter(
    initialLocation: Routes.todo,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.todo,
        builder: (context, state) {
          return TodoScreen(
            todoViewmodel: TodoViewmodel(
              todoUpdateUseCase: todoUpdateUseCase,
              todosRespository: todosRepository
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: ':id',
            builder: (contex, state) {
              final todoId = state.pathParameters['id']!;

              final TodoDetailsViewmodel todoDetailsViewmodel = TodoDetailsViewmodel(
                todoUpdateUseCase: todoUpdateUseCase,
                todosRespository: todosRepository
              );

              todoDetailsViewmodel.load.execute(todoId);

              return TodoDetailsScreen(
                todoDetailsViewmodel: todoDetailsViewmodel
              );
            }
          )
        ]
      )
    ]
  );
}