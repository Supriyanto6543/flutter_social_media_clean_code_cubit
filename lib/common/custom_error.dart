import 'package:flutter/cupertino.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ada yang error $message'),
    );
  }
}
