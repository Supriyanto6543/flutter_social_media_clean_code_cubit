import 'package:clean_unlcebob/presentation/cubit/detail_user/detail_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/custom_error.dart';
import '../../common/custom_loading.dart';
import '../../domain/entities/detail_user_entity.dart';
import '../../injection.dart' as git;

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail User',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => git.locator<DetailUserCubit>()..getUserDetail(id),
        child: BlocBuilder<DetailUserCubit, DetailUserState>(
            builder: (context, state) {
          if (state is DetailUserLoaded) {
            DetailUserEntity data = state.list;
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title,
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600)),
                            Text('${data.firstName} ${data.lastName}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Text(data.gender,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            Text(data.email,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Text(data.dateOfBirth,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Location',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 24,
                  ),
                  Text(data.location.state,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                  Text(data.location.timezone,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  Text(data.location.country,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text(data.location.city,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text(data.location.street,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            );
          } else if (state is DetailUserError) {
            return CustomError(message: state.message);
          }
          return CustomLoading();
        }),
      ),
    );
  }
}
