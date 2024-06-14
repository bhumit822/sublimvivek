import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sublime/bootstrap.dart';

final storage = GetStorage();
void main() async {
 ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  bootStrap();
}
