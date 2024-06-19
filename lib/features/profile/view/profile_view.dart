import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/auth/view/login_view.dart';
import 'package:sublime/main.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryAppButton(
                radius: 100,
                color: AppColors.primaryColor,
                onTap: () {
                  storage.erase();
                    context.goNamed(LogInAuthView.routeName);
                },
                buttonName: "Log Out",
                isDisabble: false),
          ),
        ),
      ),
    );
  }
}
