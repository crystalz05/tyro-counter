import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyro_counter/features/counter/presentation/bloc/counter_event.dart';
import 'package:tyro_counter/features/counter/presentation/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  static const int maxValue = 10;

  CounterBloc(): super(CounterState.initial()){
    on<CounterIncremented>(_onIncrement);
    on<CounterDecremented>(_onDecrement);
    on<CounterReset>(_onReset);
  }

  void _onIncrement(CounterIncremented event, Emitter<CounterState> emit){

    if(state.value >= maxValue){
      emit(state.copyWith(status: CounterStatus.error));
    }else{
      emit(state.copyWith(value: state.value + 1, status: CounterStatus.normal));
    }
  }

  void _onDecrement(CounterDecremented event, Emitter<CounterState> emit){
    if(state.value > 0){
      emit(state.copyWith(value: state.value - 1, status: CounterStatus.normal));
    }
  }

  void _onReset(CounterReset event, Emitter<CounterState> emit){
    emit(CounterState.initial());
  }
}