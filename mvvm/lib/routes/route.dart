import 'package:go_router/go_router.dart';
import 'package:mvvm/routes/routes.dart';
import 'package:mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:mvvm/ui/todo/widgets/todo_screen.dart';
import 'package:mvvm/ui/todo_details/viewmodels/todo_details_viewmodel.dart';
import 'package:mvvm/ui/todo_details/widgets/todo_details_screen.dart';
import 'package:provider/provider.dart';

GoRouter routerConfig() {
  return GoRouter(
    initialLocation: Routes.todo,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.todo,
        builder: (context, state) {
          return TodoScreen(
            todoViewmodel: TodoViewmodel(
              todoUpdateUseCase: context.read(),
              todosRespository: context.read()
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final todoId = state.pathParameters['id']!;

              final TodoDetailsViewmodel todoDetailsViewmodel = TodoDetailsViewmodel(
                todoUpdateUseCase: context.read(),
                todosRespository: context.read()
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