import 'dart:convert';
import 'dart:developer';

import 'package:clean_unlcebob/common/constant.dart';
import 'package:clean_unlcebob/common/input_create_user_model.dart';
import 'package:clean_unlcebob/data/datasource/remote_data.dart';
import 'package:clean_unlcebob/data/model/create_user_model.dart';
import 'package:clean_unlcebob/data/model/detail_user_model.dart';
import 'package:clean_unlcebob/data/model/list_comment_model.dart';
import 'package:clean_unlcebob/data/model/list_post_model.dart';
import 'package:clean_unlcebob/data/model/list_user_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataImpl implements RemoteData {
  final http.Client client;

  RemoteDataImpl(this.client);

  @override
  Future<CreateUserModel> createUserModel(InputCreateUserModel icum) async {
    final request = await http.post(Uri.parse("${Constant.baseUrl}user/create"),
        headers: {
          'app-id': Constant.appId
        },
        body: {
          "firstName": icum.firstName,
          "lastName": icum.lastName,
          "email": icum.email
        });

    final response = jsonDecode(request.body);
    log("log register user: $response");
    return CreateUserModel.fromJson(response);
  }

  @override
  Future<DetailUserModel> detailUserModel(String id) async {
    final request = await http.get(Uri.parse("${Constant.baseUrl}user/$id"),
        headers: {'app-id': Constant.appId});
    final response = jsonDecode(request.body);
    return DetailUserModel.fromJson(response);
  }

  @override
  Future<List<ListCommentModel>> listCommentModel(int pages) async {
    final request = await http.get(
        Uri.parse(
            "${Constant.baseUrl}comment?page=${pages.toString()}&limit=14"),
        headers: {'app-id': Constant.appId});
    final response = jsonDecode(request.body);
    final List data = response['data'];
    return data.map((value) => ListCommentModel.fromJson(value)).toList();
  }

  @override
  Future<List<ListPostModel>> listPostModel(int pages) async {
    final request = await http.get(
        Uri.parse("${Constant.baseUrl}post?page=${pages.toString()}&limit=14"),
        headers: {'app-id': Constant.appId});
    final response = jsonDecode(request.body);
    final List data = response['data'];
    return data.map((e) => ListPostModel.fromJson(e)).toList();
  }

  @override
  Future<List<ListUserModel>> listUserModel(int pages) async {
    final request = await http.get(
        Uri.parse("${Constant.baseUrl}user?page=${pages.toString()}&limit=10"),
        headers: {'app-id': Constant.appId});
    final response = jsonDecode(request.body);
    final List data = response['data'];
    return data.map((e) => ListUserModel.fromJson(e)).toList();
  }
}
