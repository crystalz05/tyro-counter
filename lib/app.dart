import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/app_router.dart';
import 'core/di/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      title: 'Counter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter.router
    );
  }
}