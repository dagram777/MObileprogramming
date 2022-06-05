part of 'upload_bloc.dart';

enum upload_status {initial,success,failure}
abstract class UploadState extends Equatable {
  const UploadState();
  
  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}
// class Upload extends UploadState{
//   final upload_status status;
//   final Course courses;




// }
