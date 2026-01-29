enum CounterStatus { initial, normal, error }

class CounterState {

  final int value;
  final CounterStatus status;

  const CounterState({
    required this.value,
    required this.status,
  });

  factory CounterState.initial() {
    return const CounterState(value: 0, status: CounterStatus.initial);
  }

  CounterState copyWith({
    int? value,
    CounterStatus? status,
  }){
    return CounterState(
        value: value ?? this.value,
        status: status ?? this.status
    );
  }
}

