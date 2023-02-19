import 'package:clean_unlcebob/data/model/list_post_model.dart';
import 'package:equatable/equatable.dart';

class ListCommentEntity extends Equatable {
  ListCommentEntity({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
  });
  late final String id;
  late final String message;
  late final OwnerModel owner;
  late final String post;
  late final String publishDate;

  @override
  // TODO: implement props
  List<Object?> get props => [id, message, owner, post, publishDate];
}
