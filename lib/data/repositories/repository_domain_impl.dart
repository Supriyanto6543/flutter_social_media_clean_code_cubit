import 'package:clean_unlcebob/data/repositories/remote_data_impl.dart';
import 'package:clean_unlcebob/domain/entities/create_user_entity.dart';
import 'package:clean_unlcebob/domain/entities/detail_user_entity.dart';
import 'package:clean_unlcebob/domain/entities/list_comment_entity.dart';
import 'package:clean_unlcebob/domain/entities/list_post_entity.dart';
import 'package:clean_unlcebob/domain/entities/list_user_entity.dart';
import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

import '../../common/input_create_user_model.dart';

class RepositoryDomainImpl implements RepositoriesDomain {
  final RemoteDataImpl remoteDataImpl;

  RepositoryDomainImpl(this.remoteDataImpl);

  @override
  Future<Either<String, CreateUserEntity>> getCreateUser(
      InputCreateUserModel icum) async {
    try {
      final result = await remoteDataImpl.createUserModel(icum);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, DetailUserEntity>> getDetailUser(String id) async {
    try {
      final result = await remoteDataImpl.detailUserModel(id);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListCommentEntity>>> getListComment(
      int pages) async {
    try {
      final result = await remoteDataImpl.listCommentModel(pages);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListPostEntity>>> getListPost(int pages) async {
    try {
      final result = await remoteDataImpl.listPostModel(pages);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListUserEntity>>> getListUser(int pages) async {
    try {
      final result = await remoteDataImpl.listUserModel(pages);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
