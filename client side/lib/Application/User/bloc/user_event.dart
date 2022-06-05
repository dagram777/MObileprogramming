part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends UserEvent{
  Student user;
  SignUpButtonPressed(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class LogInButtonPressed extends UserEvent{
  Student user;
  LogInButtonPressed(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}