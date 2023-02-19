import 'package:clean_unlcebob/common/custom_loading.dart';
import 'package:clean_unlcebob/presentation/cubit/list_comment/list_comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/custom_error.dart';
import '../../domain/entities/list_comment_entity.dart';
import '../../injection.dart' as git;

class ListCommentScreen extends StatelessWidget {
  const ListCommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Comment',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => git.locator<ListCommentCubit>()..getCommentList(),
        child: BlocBuilder<ListCommentCubit, ListCommentState>(
            builder: (context, state) {
          if (state is ListCommentLoaded) {
            return Container(
                child: SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: () => context.read<ListCommentCubit>()..getRefresh(),
              onLoading: () => context.read<ListCommentCubit>()..getLoadMore(),
              controller: ListCommentCubit.controller,
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (BuildContext context, int index) {
                  ListCommentEntity data = state.list[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${data.owner.firstName} ${data.owner.lastName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text(data.publishDate)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.message,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  );
                },
              ),
            ));
          } else if (state is ListCommentError) {
            return CustomError(message: state.message);
          }
          return CustomLoading();
        }),
      ),
    );
  }
}
