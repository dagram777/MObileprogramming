part of 'comment_bloc.dart';
// enum comment_status {initial,failure,success}
// abstract class CommentState extends Equatable{}
// class commentState extends CommentState {
//   final comment_status status;
//   final  List<Comment> comment;
//  commentState({
//     this.comment = const <Comment>[],
//     this.status = comment_status.initial
//  } );
//  commentState copyWith({
//    comment_status? status,
//    List<Comment>? comment,
//  }){
//    return commentState(comment:comment ?? this.comment,status:status ?? this.status);
//  }
  
 
//   @override
//   List<Object> get props => [];
// }

class CommentState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CommentInitial extends CommentState{}

class CommentSuccess extends CommentState{
  List<Comment> comment;
  CommentSuccess(this.comment);
}

class CommentFailed extends CommentState{}

class CommentLoading extends CommentState{}

class CommentCreated extends CommentState{}

class CommentUpdated extends CommentState{}

class CommentDeleted extends CommentState{}