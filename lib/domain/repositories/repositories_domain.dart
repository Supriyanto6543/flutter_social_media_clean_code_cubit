import 'package:clean_unlcebob/common/input_create_user_model.dart';
import 'package:clean_unlcebob/domain/entities/create_user_entity.dart';
import 'package:clean_unlcebob/domain/entities/detail_user_entity.dart';
import 'package:clean_unlcebob/domain/entities/list_comment_entity.dart';
import 'package:clean_unlcebob/domain/entities/list_user_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/list_post_entity.dart';

abstract class RepositoriesDomain {
  Future<Either<String, List<ListUserEntity>>> getListUser(int pages);
  Future<Either<String, List<ListPostEntity>>> getListPost(int id);
  Future<Either<String, List<ListCommentEntity>>> getListComment(int id);
  Future<Either<String, CreateUserEntity>> getCreateUser(
      InputCreateUserModel icum);
  Future<Either<String, DetailUserEntity>> getDetailUser(String id);
}
