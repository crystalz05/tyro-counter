abstract class SimpleEvent {}

class UserNameChanged extends SimpleEvent{
  final String value;

  UserNameChanged(this.value);

}

abstract class ButtonEvent {}

class ButtonActiveEvent extends ButtonEvent{
  final bool isActive;

  ButtonActiveEvent(this.isActive);
}

