import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_state.dart';
import 'package:tyro_counter/features/theme/presentation/bloc/theme_event.dart';

class ThemeBloc extends Bloc<ThemeToggled, ThemeState> {

  ThemeBloc(): super(const ThemeState(false)){
    on<ThemeToggled>(_onThemeToggled);
  }

  void _onThemeToggled(ThemeToggled event, Emitter<ThemeState> emit){
    emit(ThemeState(!state.isDark));
  }
}