import 'package:equatable/equatable.dart';

class Student extends Equatable{
  int id;
  String username;
  String email;
  String password;
  Student({
    required this.id,
    required this.username,
    required this.password,
    required this.email
  });
factory Student.fromJson(Map<String,dynamic> json){
  return Student(
    id: json['id'],
    username: json['username'],
    email : json['emial'],
    password: json['password'],
 


  );
  
}
  Map<String,dynamic> toJson()=>{
    'id' : id,
    'username':username,
    'email':email,
    'password':password,
  };
  
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
