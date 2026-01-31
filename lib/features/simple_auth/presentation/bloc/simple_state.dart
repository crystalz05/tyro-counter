enum UsernameStatus {
  initial,
  valid,
  invalid
}

class SimpleState {

  final String value;
  final UsernameStatus status;
  final String? errorMessage;

  const SimpleState({
    required this.value,
    required this.status,
    this.errorMessage
  });

  factory SimpleState.initial(){
    return const SimpleState(value: '', status: UsernameStatus.initial);
  }

  SimpleState copyWith({
    String? value,
    UsernameStatus? status,
    String? errorMessage
  }) {
    return SimpleState(
        value: value ?? this.value,
        status: status ?? this.status,
        errorMessage: errorMessage
    );
  }
}

class ButtonToggleState {
  final bool isActive;

  const ButtonToggleState({
    required this.isActive
  });

  factory ButtonToggleState.initial() => const ButtonToggleState(isActive: false);
}


