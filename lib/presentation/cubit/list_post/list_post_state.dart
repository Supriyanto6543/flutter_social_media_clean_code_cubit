import 'package:flutter/cupertino.dart';

import '../../../domain/entities/list_post_entity.dart';

@immutable
abstract class ListPostState {}

class ListPostInitial extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<ListPostEntity> list;
  final String message;
  final int pages;

  ListPostLoaded(this.list, this.message, {this.pages = 1});
}

class ListPostError extends ListPostState {
  final String message;
  ListPostError(this.message);
}
