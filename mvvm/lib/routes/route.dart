import 'package:go_router/go_router.dart';
import 'package:mvvm/data/repositories/todos/todos_repository_remote.dart';
import 'package:mvvm/data/services/api/api_client.dart';
import 'package:mvvm/routes/routes.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/todo_screen.dart';
import 'package:mvvm/ui/todo_details/widgets/todo_details_screen.dart';

GoRouter routerConfig() {
  return GoRouter(
    initialLocation: Routes.todo,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.todo,
        builder: (context, state) {
          return TodoScreen(
            todoViewmodel: TodoViewmodel(
              todosRespository: TodosRepositoryRemote(
                apiClient: ApiClient(
                  host: "10.0.0.195"
                )
              )
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: ':id',
            builder: (contex, state) {
              final todoId = state.pathParameters['id']!;
              return TodoDetailsScreen(id: todoId);
            }
          )
        ]
      )
    ]
  );
}