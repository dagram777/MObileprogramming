part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserSignUpSucess extends UserState{}

class UserSignUpFailed extends UserState{}

class UserSignUpLoading extends UserState{}

class UserLogInLoading extends UserState{}

class UserAuthenticated extends UserState{}

class UserUnAuthenticated extends UserState{}