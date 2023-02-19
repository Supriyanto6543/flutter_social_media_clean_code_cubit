import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

import '../entities/list_post_entity.dart';

class GetListPost {
  final RepositoriesDomain repositoriesDomain;

  GetListPost(this.repositoriesDomain);

  Future<Either<String, List<ListPostEntity>>> fetchListPost(int pages) {
    return repositoriesDomain.getListPost(pages);
  }
}
