import 'package:flutter/material.dart';
import 'package:sublime/features/MyReturn/view/my_return_view.dart';
import 'package:sublime/features/message/view/message_view.dart';
import 'package:sublime/features/profile/view/profile_view.dart';

class BottomNavProvider extends ChangeNotifier {
  
    int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
    TextEditingController newThreadController = TextEditingController();

  List<Widget> bottomNavBarViews = [
    MessageView(),
    MyRetuenVIew(),
    ProfileView(),
  ];

  List<String> bottomNavBarIcons = [
    "assets/icons/svg/message.svg",
    "assets/icons/svg/myReturn.svg",
    "assets/icons/svg/profile_setting.svg",
  ];
}
