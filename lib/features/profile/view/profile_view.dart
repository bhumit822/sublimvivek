import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'message';
  static const route = '/message';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Text("PROFILE VIEW"),
        ),
      ),
    );
  }
}
