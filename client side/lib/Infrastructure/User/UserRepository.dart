import 'package:flutter_application_9/Domain/Student.dart';
import 'package:flutter_application_9/Infrastructure/User/UserDataProvider.dart';

class UserRepository{
  UserDataProvider userDataProvider;
  UserRepository(this.userDataProvider);

  Future<void> signUp(Student user) async{
    return await userDataProvider.signUp(user);
  }

  Future<String> logIn(Student user) async{
    final token = await userDataProvider.logIn(user);
    return token;
  }

}