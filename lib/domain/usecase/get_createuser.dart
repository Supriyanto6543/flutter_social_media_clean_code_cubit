import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

import '../../common/input_create_user_model.dart';
import '../entities/create_user_entity.dart';

class GetCreateUser {
  final RepositoriesDomain repositoriesDomain;

  GetCreateUser(this.repositoriesDomain);

  Future<Either<String, CreateUserEntity>> fetchCreateUser(
      InputCreateUserModel icum) {
    return repositoriesDomain.getCreateUser(icum);
  }
}
