
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyro_counter/features/simple_auth/presentation/bloc/simple_event.dart';
import 'package:tyro_counter/features/simple_auth/presentation/bloc/simple_state.dart';

class SimpleBloc extends Bloc<SimpleEvent, SimpleState> {

  SimpleBloc(): super(SimpleState.initial()){
    on<UserNameChanged>(_onUserNameChanged);
  }

  void _onUserNameChanged(UserNameChanged event, Emitter<SimpleState> emit){

    final value = event.value.trim();

    if(value.isEmpty){
      emit(SimpleState.initial());
      return;
    }


    //Invalid characters
    final isAlphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    if(!isAlphanumeric.hasMatch(value)){
      emit(
          state.copyWith(
              value: value,
              status: UsernameStatus.invalid,
              errorMessage: "Only letters and numbers are allowed"
          )
      );
      return;
    }

    //too short
    if(value.length <= 3){
      emit(
        state.copyWith(
          value: value,
          status: UsernameStatus.invalid,
          errorMessage: "Username must be at least 3 characters long"
        )
      );
      return;
    }

    //valid username
    emit(
      state.copyWith(
        value: value,
        status: UsernameStatus.valid,
        errorMessage: null,
      ),
    );
  }
}

class ButtonToggleBloc extends Bloc<ButtonEvent, ButtonToggleState>{

  ButtonToggleBloc(): super(ButtonToggleState.initial()){
    on<ButtonActiveEvent>(_onButtonActiveEvent);
  }

  void _onButtonActiveEvent(ButtonActiveEvent event, Emitter<ButtonToggleState> emit){
    emit(ButtonToggleState(isActive:  event.isActive));
  }
}