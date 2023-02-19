import 'package:clean_unlcebob/data/model/list_comment_model.dart';
import 'package:clean_unlcebob/data/model/list_post_model.dart';
import 'package:clean_unlcebob/data/model/list_user_model.dart';

import '../../common/input_create_user_model.dart';
import '../model/create_user_model.dart';
import '../model/detail_user_model.dart';

abstract class RemoteData {
  Future<List<ListUserModel>> listUserModel(int pages);
  Future<List<ListPostModel>> listPostModel(int pages);
  Future<List<ListCommentModel>> listCommentModel(int pages);
  Future<DetailUserModel> detailUserModel(String id);
  Future<CreateUserModel> createUserModel(InputCreateUserModel icum);
}
