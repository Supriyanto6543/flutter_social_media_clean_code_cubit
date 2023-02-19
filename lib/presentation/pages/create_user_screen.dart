import 'package:clean_unlcebob/common/enum_status.dart';
import 'package:clean_unlcebob/common/my_route.dart';
import 'package:clean_unlcebob/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocBuilder<CreateUserCubit, CreateUserState>(
          builder: (context, state) {
        if (state is CreateUserLoaded) {
          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: CreateUserCubit.first,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'First name',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.green)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: CreateUserCubit.last,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Last name',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.green)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: CreateUserCubit.email,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: state.enumStatus != EnumStatus.loading
                      ? () {
                          context
                              .read<CreateUserCubit>()
                              .fetchUserCreate(context);
                        }
                      : null,
                  child: state.enumStatus == EnumStatus.loading
                      ? CircularProgressIndicator()
                      : Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoute.listPost);
                  },
                  child: Text(
                    'Lihat Post',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoute.listComment);
                  },
                  child: Text(
                    'Lihat Comment',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoute.listUser);
                  },
                  child: Text(
                    'Lihat User',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        } else if (state is CreateUserError) {
          return Container(
            child: Text('Ada error'),
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }
}
