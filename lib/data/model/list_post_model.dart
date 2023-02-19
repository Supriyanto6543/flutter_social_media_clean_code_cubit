import 'package:clean_unlcebob/domain/entities/list_post_entity.dart';
import 'package:equatable/equatable.dart';

class ListPostModel extends Equatable {
  ListPostModel({
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

  ListPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = List.castFrom<dynamic, String>(json['tags']);
    text = json['text'];
    publishDate = json['publishDate'];
    owner = OwnerModel.fromJson(json['owner']);
  }

  ListPostEntity toEntity() => ListPostEntity(
      id: id,
      image: image,
      likes: likes,
      tags: tags,
      text: text,
      publishDate: publishDate,
      owner: owner);

  @override
  // TODO: implement props
  List<Object?> get props => [id, image, likes, tags, text, publishDate, owner];
}

class OwnerModel extends Equatable {
  OwnerModel({
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

  OwnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  OwnerEntity toEntity() => OwnerEntity(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, firstName, lastName, picture];
}
