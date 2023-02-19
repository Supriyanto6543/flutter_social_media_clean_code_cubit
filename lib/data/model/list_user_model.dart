import 'package:clean_unlcebob/domain/entities/list_user_entity.dart';
import 'package:equatable/equatable.dart';

class ListUserModel extends Equatable {
  ListUserModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });
  late final String id;
  late final String title;
  late final String firstName;
  late final String lastName;
  late final String picture;

  ListUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  ListUserEntity toEntity() => ListUserEntity(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, firstName, lastName, picture];
}
