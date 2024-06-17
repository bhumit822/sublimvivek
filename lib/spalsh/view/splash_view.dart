import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/auth/view/login_view.dart';
import 'package:sublime/features/bottom_navigation_bar/view/bottom__nav_bar_view.dart';
import 'package:sublime/main.dart';

class SplashView extends StatefulWidget {
  static const routeName = 'splash';
  static const route = '/';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      storage.read('bearer_token') == null || storage.read('bearer_token') == ""
          ? context.goNamed(LogInAuthView.routeName)
          : context.goNamed(BottomNavigationBarView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Image.asset(
        'assets/images/ss.jpg',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
