import 'package:clean_unlcebob/common/my_route.dart';
import 'package:clean_unlcebob/presentation/cubit/list_user/list_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/custom_error.dart';
import '../../common/custom_loading.dart';
import '../../domain/entities/list_user_entity.dart';
import '../../injection.dart' as git;

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List User',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => git.locator<ListUserCubit>()..getUserList(),
        child: BlocBuilder<ListUserCubit, ListUserState>(
            builder: (context, state) {
          if (state is ListUserLoaded) {
            return Container(
              child: SmartRefresher(
                controller: ListUserCubit.controller,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: () => context.read<ListUserCubit>()..getRefresh(),
                onLoading: () => context.read<ListUserCubit>()..getLoadMore(),
                child: ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    ListUserEntity data = state.list[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoute.detailUser,
                            arguments: {'id': data.id});
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(6),
                        child: Row(
                          children: [
                            Image.network(
                              data.picture,
                              width: 110,
                              height: 126,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.title,
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600)),
                                Text('${data.firstName} ${data.lastName}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is ListUserError) {
            return CustomError(message: state.message);
          }
          return CustomLoading();
        }),
      ),
    );
  }
}
