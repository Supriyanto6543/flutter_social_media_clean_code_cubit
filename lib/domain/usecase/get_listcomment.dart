import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

import '../entities/list_comment_entity.dart';

class GetListComment {
  final RepositoriesDomain repositoriesDomain;

  GetListComment(this.repositoriesDomain);

  Future<Either<String, List<ListCommentEntity>>> fetchListComment(int pages) {
    return repositoriesDomain.getListComment(pages);
  }
}
