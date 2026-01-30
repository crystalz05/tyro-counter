abstract class SimpleEvent {}

class UserNameChanged extends SimpleEvent{
  final String value;

  UserNameChanged(this.value);
}

