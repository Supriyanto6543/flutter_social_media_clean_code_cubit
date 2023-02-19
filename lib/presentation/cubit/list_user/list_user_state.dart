part of 'list_user_cubit.dart';

@immutable
abstract class ListUserState {}

class ListUserInitial extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<ListUserEntity> list;
  final String message;
  final int pages;

  ListUserLoaded(this.list, this.message, {this.pages = 1});
}

class ListUserError extends ListUserState {
  final String message;
  ListUserError(this.message);
}
