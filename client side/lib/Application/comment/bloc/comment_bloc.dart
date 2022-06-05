import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_9/Domain/Comment.dart';
import 'package:flutter_application_9/Infrastructure/comment/commentRepoistory.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentRepository commentRepository;
  CommentBloc(this.commentRepository) : super( CommentInitial()) {
    
      // TODO: implement event handler
      on<CommentFetch>(_oncommentFetch);
      on<CommentCreate>(_oncommentCreate);
      on<CommentUpdate>(_oncommentUpdate);
      on<CommentDelete>(_oncommentDelete);

  
  }

  Future<void> _oncommentFetch(CommentFetch event,Emitter<CommentState> emit)async{
    emit (CommentLoading());
    try {
      final response = await commentRepository.getComment(event.id);
      emit(CommentSuccess(response));
      
    } catch (e) {
      emit(CommentFailed());
      
    }
  }

  Future<void> _oncommentCreate(CommentCreate event,Emitter<CommentState> emit)async{
    try {
      final response = await commentRepository.comment(event.comment, event.id);
      emit(CommentCreated());
      
    } catch (e) {
      emit(CommentFailed());
    }

  }

  Future<void> _oncommentUpdate(CommentUpdate event,Emitter<CommentState> emit)async{
    try {
      final response = await commentRepository.updateComment(event.comment, event.id);
      emit(CommentUpdated());
      
    } catch (e) {
      emit(CommentFailed());
    }

  }

  Future<void> _oncommentDelete(CommentDelete event,Emitter<CommentState> emit)async{
    try {
      final response = await commentRepository.delete(event.id);
      emit(CommentDeleted());
      
    } catch (e) {
      emit(CommentFailed());
    }

  }



}
