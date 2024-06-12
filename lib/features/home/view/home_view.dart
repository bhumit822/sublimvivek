import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home';
  static const route = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
