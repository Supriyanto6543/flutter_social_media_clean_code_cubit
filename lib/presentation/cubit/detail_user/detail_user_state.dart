part of 'detail_user_cubit.dart';

@immutable
abstract class DetailUserState {}

class DetailUserInitial extends DetailUserState {}

class DetailUserLoaded extends DetailUserState {
  final DetailUserEntity list;
  final String message;

  DetailUserLoaded(this.list, this.message);
}

class DetailUserError extends DetailUserState {
  final String message;

  DetailUserError(this.message);
}
