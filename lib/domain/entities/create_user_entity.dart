import 'package:equatable/equatable.dart';

class CreateUserEntity extends Equatable {
  CreateUserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.registerDate,
    required this.updatedDate,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String registerDate;
  late final String updatedDate;

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, firstName, lastName, email, registerDate, updatedDate];
}
