import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tyro_counter/app.dart';
import 'package:tyro_counter/core/di/injection.dart';

void main() {
  runZonedGuarded(
        () async {

      WidgetsFlutterBinding.ensureInitialized();

      await configureDependencies();

      runApp(const App());
    },
        (error, stack) {
      if (kDebugMode) {
        print('Error: $error');
      }
    },
  );
}