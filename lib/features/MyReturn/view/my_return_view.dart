import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/MyReturn/view/retun_detail_view.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(MyReturnDetailView.routeName,
                          extra: {'index': 0});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.lightGreen,
                      child: Text("View Return Details"),
                    ),
                  ),
                  // SizedBox( 
                  //   width: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     context.pushNamed(MyReturnDetailView.routeName,
                  //         extra: {'index': 1});
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 50.spMin,
                  //     width: 50.spMin,
                  //     color: Colors.lightGreen,
                  //     child: Text("2"),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     context.pushNamed(MyReturnDetailView.routeName,
                  //         extra: {'index': 2});
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 50.spMin,
                  //     width: 50.spMin,
                  //     color: Colors.lightGreen,
                  //     child: Text("3"),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
