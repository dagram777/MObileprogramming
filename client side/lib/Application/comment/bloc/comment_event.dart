part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}
class CommentFetch extends CommentEvent{
  int id;
  CommentFetch(this.id);
}

class CommentCreate extends CommentEvent{
  String comment;
  int id;
  CommentCreate(this.comment,this.id);
}

class CommentUpdate extends CommentEvent{
  String comment;
  int id;
  CommentUpdate(this.comment, this.id);
}

class CommentDelete extends CommentEvent{
  int id;
  CommentDelete(this.id);
}


