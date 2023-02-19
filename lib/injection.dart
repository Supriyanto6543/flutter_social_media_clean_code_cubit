import 'package:clean_unlcebob/data/repositories/remote_data_impl.dart';
import 'package:clean_unlcebob/data/repositories/repository_domain_impl.dart';
import 'package:clean_unlcebob/domain/repositories/repositories_domain.dart';
import 'package:clean_unlcebob/domain/usecase/get_createuser.dart';
import 'package:clean_unlcebob/domain/usecase/get_detailuser.dart';
import 'package:clean_unlcebob/domain/usecase/get_listcomment.dart';
import 'package:clean_unlcebob/domain/usecase/get_listpost.dart';
import 'package:clean_unlcebob/domain/usecase/get_listuser.dart';
import 'package:clean_unlcebob/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:clean_unlcebob/presentation/cubit/detail_user/detail_user_cubit.dart';
import 'package:clean_unlcebob/presentation/cubit/list_comment/list_comment_cubit.dart';
import 'package:clean_unlcebob/presentation/cubit/list_post/list_post_cubit.dart';
import 'package:clean_unlcebob/presentation/cubit/list_user/list_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final locator = GetIt.instance;

void initialize() {
  //use case
  locator.registerFactory(() => GetCreateUser(locator()));
  locator.registerFactory(() => GetDetailUser(locator()));
  locator.registerFactory(() => GetListComment(locator()));
  locator.registerFactory(() => GetListPost(locator()));
  locator.registerFactory(() => GetListUser(locator()));

  //state manage cubit
  locator.registerFactory(() => ListUserCubit(locator()));
  locator.registerFactory(() => ListPostCubit(locator()));
  locator.registerFactory(() => ListCommentCubit(locator()));
  locator.registerFactory(() => DetailUserCubit(locator()));
  locator.registerFactory(() => CreateUserCubit(locator()));

  //repository domain impl
  locator.registerFactory<RepositoriesDomain>(
      () => RepositoryDomainImpl(locator()));

  //repository remote data
  locator.registerFactory(() => RemoteDataImpl(locator()));

  // external library
  locator.registerFactory(() => Client());
}
