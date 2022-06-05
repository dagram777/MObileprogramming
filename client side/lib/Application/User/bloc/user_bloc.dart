
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_9/Domain/Student.dart';
import 'package:flutter_application_9/Infrastructure/User/UserRepository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<SignUpButtonPressed>(_signUpButtonPressed);
    on<LogInButtonPressed>(_logInButtonPressed);
  }

    Future<void> _signUpButtonPressed(SignUpButtonPressed event,Emitter<UserState> emit)async{
      emit(UserSignUpLoading());

      try {
        final response = await userRepository.signUp(event.user);
        emit(UserSignUpSucess());
        
      } catch (e) {
        emit(UserSignUpFailed());
      }

    }

    Future<void> _logInButtonPressed(LogInButtonPressed event,Emitter<UserState> emit)async{
      emit(UserLogInLoading());

      try {
        final response = await userRepository.logIn(event.user);
        emit(UserAuthenticated());
        print("hi");
      } catch (e) {
        emit(UserUnAuthenticated());
      }

    }

}
