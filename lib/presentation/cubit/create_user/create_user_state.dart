part of 'create_user_cubit.dart';

@immutable
abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoaded extends CreateUserState {
  final CreateUserEntity? createUserEntity;
  final String message;
  final EnumStatus enumStatus;

  CreateUserLoaded(this.createUserEntity, this.message, this.enumStatus);
}

class CreateUserError extends CreateUserState {
  final String message;
  final EnumStatus enumStatus;

  CreateUserError(this.message, this.enumStatus);
}
