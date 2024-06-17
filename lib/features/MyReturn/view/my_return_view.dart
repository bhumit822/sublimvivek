import 'package:flutter/material.dart';

class MyRetuenVIew extends StatelessWidget {
  const MyRetuenVIew({super.key});
  static const routeName = 'MyRetuen';
  static const route = '/MyRetuen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(

height: double.infinity,        child: Center(
          child: Text("MyRetuen VIEW"),
        ),
      ),
    );
  }
}