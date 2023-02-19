import 'package:clean_unlcebob/data/model/list_post_model.dart';
import 'package:equatable/equatable.dart';

class ListPostEntity extends Equatable {
  ListPostEntity({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    required this.owner,
  });
  late final String id;
  late final String image;
  late final int likes;
  late final List<String> tags;
  late final String text;
  late final String publishDate;
  late final OwnerModel owner;

  @override
  // TODO: implement props
  List<Object?> get props => [id, image, likes, tags, text, publishDate, owner];
}

class OwnerEntity extends Equatable {
  OwnerEntity({
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
