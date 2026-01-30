import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_state.dart';

import 'core/app_router.dart';
import 'core/di/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = getIt<AppRouter>();
    return BlocProvider(create: (_) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state){
              return MaterialApp.router(
                  title: 'Counter app',
                  debugShowCheckedModeBanner: false,
                  theme: state.isDark ? ThemeData.dark() : ThemeData.light(),
                  routerConfig: appRouter.router
              );
            }
        )
    );
  }
}