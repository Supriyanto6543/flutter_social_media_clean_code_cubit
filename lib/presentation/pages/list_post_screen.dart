import 'package:clean_unlcebob/common/custom_error.dart';
import 'package:clean_unlcebob/common/custom_loading.dart';
import 'package:clean_unlcebob/presentation/cubit/list_post/list_post_cubit.dart';
import 'package:clean_unlcebob/presentation/cubit/list_post/list_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../domain/entities/list_post_entity.dart';
import '../../injection.dart' as git;

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Post',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => git.locator<ListPostCubit>()..getPostList(),
        child: BlocBuilder<ListPostCubit, ListPostState>(
            builder: (context, state) {
          if (state is ListPostLoaded) {
            return Container(
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: () => context.read<ListPostCubit>()..getRefresh(),
                onLoading: () => context.read<ListPostCubit>()..getLoadMore(),
                controller: ListPostCubit.controller,
                child: ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    ListPostEntity data = state.list[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Image.network(
                            data.image,
                            width: 110,
                            height: 126,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Text(data.text)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is ListPostError) {
            return CustomError(message: state.message);
          }
          return CustomLoading();
        }),
      ),
    );
  }
}
