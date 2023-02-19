import 'package:equatable/equatable.dart';

class ListUserEntity extends Equatable {
  ListUserEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, firstName, lastName, picture];
}
