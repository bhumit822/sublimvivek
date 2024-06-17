import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sublime/bootstrap.dart';

final storage = GetStorage();
void main() async {
 ScreenUtil.ensureScreenSize();
  await GetStorage.init();
   HttpOverrides.global = MyHttpOverrides();
  bootStrap();
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}