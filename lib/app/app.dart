import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/app/Routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:sublime/app/provider/app_provider.dart';
import 'package:sublime/features/auth/provide/auth_provider.dart';
import 'package:sublime/features/bottom_navigation_bar/provider/bottom_nav_bar_provider.dart';

 final GlobalKey<ScaffoldMessengerState> globalScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

class MainApp extends StatelessWidget {
  MainApp({super.key});
 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(
            
          ),
        ),
      ],
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(390, 873),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GestureDetector(
              onTap:  (){
                primaryFocus?.unfocus();
              },
              child: MaterialApp.router(
                scaffoldMessengerKey: globalScaffoldKey,
                routerConfig: AppRoutes.router,
                title: 'Sublime',
                theme: ThemeData(fontFamily: 'Poppins'),
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        );
      },
    );
  }
}
