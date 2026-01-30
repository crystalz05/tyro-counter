import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:tyro_counter/features/counter/presentation/pages/counter_page.dart';
import 'package:tyro_counter/features/simple_auth/presentation/pages/username_screen.dart';

@singleton
class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/username',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CounterPage(),
      ),
      GoRoute(
        path: '/username',
        builder: (context, state) => const UsernameScreen(),
      ),
    ],
  );
}
