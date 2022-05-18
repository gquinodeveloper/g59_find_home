import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g59_find_home/app/core/utils/injection_dependecy.dart';
import 'package:g59_find_home/app/routes/app_pages.dart';
import 'package:g59_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  InjectionDependency.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (widget) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.SPLASH,
          getPages: AppPages.pages,
        );
      }
    );
  }
}
