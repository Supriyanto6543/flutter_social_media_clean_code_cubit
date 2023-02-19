import 'package:clean_unlcebob/domain/entities/create_user_entity.dart';
import 'package:equatable/equatable.dart';

class CreateUserModel extends Equatable {
  CreateUserModel({
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

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    registerDate = json['registerDate'];
    updatedDate = json['updatedDate'];
  }

  CreateUserEntity toEntity() => CreateUserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      registerDate: registerDate,
      updatedDate: updatedDate);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, firstName, lastName, email, registerDate, updatedDate];
}
