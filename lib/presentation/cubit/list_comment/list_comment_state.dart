part of 'list_comment_cubit.dart';

@immutable
abstract class ListCommentState {}

class ListCommentInitial extends ListCommentState {}

class ListCommentLoaded extends ListCommentState {
  final List<ListCommentEntity> list;
  final String message;
  final int pages;

  ListCommentLoaded(this.list, this.message, {this.pages = 1});
}

class ListCommentError extends ListCommentState {
  final String message;

  ListCommentError(this.message);
}
