import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:tyro_counter/features/counter/presentation/pages/counter_page.dart';

@singleton
class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );
}
