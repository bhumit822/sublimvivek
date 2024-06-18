import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sublime/features/bottom_navigation_bar/provider/bottom_nav_bar_provider.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/chat_textfield_widget.dart';
import 'package:sublime/ui_component/widgets/textField_widget.dart';

class BottomNavigationBarView extends StatelessWidget {
  static const routeName = 'bottomNavBar';
  static const route = '/bottomNavBar';
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: bottomNavProvider.currentIndex,
                  children: bottomNavProvider.bottomNavBarViews,
                ),
              ),
              ChatTextFieldWidget(
                  controller: bottomNavProvider.newThreadController)
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            height: 85.spMin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  bottomNavProvider.bottomNavBarIcons.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        bottomNavProvider.currentIndex = index;
                      },
                      child: Container(
                        child: SvgPicture.asset(
                          bottomNavProvider.bottomNavBarIcons[index],
                          height: 25.spMin,
                          width: 25.spMin,
                          
                          color: bottomNavProvider.currentIndex == index
                              ? AppColors.iconSelectedColor
                              : AppColors.iconunSelectedColor,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
