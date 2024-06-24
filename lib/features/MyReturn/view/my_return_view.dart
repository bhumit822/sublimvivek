import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/MyReturn/view/retun_detail_view.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';

class MyRetuenVIew extends StatelessWidget {
  const MyRetuenVIew({super.key});
  static const routeName = 'MyRetuen';
  static const route = '/MyRetuen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text("MyRetuen VIEW"),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: PrimaryAppButton(
                    radius: 100,
                    color: AppColors.primaryColor,
                    onTap: () {
                      context.pushNamed(MyReturnDetailView.routeName,
                          extra: {'index': 0});
                    },
                    buttonName: "example-qrcode",
                    isDisabble: false),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: PrimaryAppButton(
                    radius: 100,
                    color: AppColors.primaryColor,
                    onTap: () {
                      context.pushNamed(MyReturnDetailView.routeName,
                          extra: {'index': 1});
                    },
                    buttonName: "example-label",
                    isDisabble: false),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: PrimaryAppButton(
                    radius: 100,
                    color: AppColors.primaryColor,
                    onTap: () {
                      context.pushNamed(MyReturnDetailView.routeName,
                          extra: {'index': 2});
                    },
                    buttonName: "example-tracking",
                    isDisabble: false),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
