import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

import '../entities/detail_user_entity.dart';

class GetDetailUser {
  final RepositoriesDomain repositoriesDomain;

  GetDetailUser(this.repositoriesDomain);

  Future<Either<String, DetailUserEntity>> fetchDetailUser(String id) {
    return repositoriesDomain.getDetailUser(id);
  }
}
