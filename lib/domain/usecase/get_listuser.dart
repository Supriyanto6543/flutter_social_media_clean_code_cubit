import 'package:clean_unlcebob/domain/entities/list_user_entity.dart';
import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

class GetListUser {
  final RepositoriesDomain repositoriesDomain;

  GetListUser(this.repositoriesDomain);

  Future<Either<String, List<ListUserEntity>>> fetchUserList(int pages) {
    return repositoriesDomain.getListUser(pages);
  }
}
