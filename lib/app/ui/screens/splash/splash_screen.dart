import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/find_home.svg"),
              RichText(
                text: TextSpan(
                  text: "Find",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                  children: [
                    TextSpan(
                      text: "Home",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 40.w,
                child: LinearProgressIndicator(
                  backgroundColor: AppTheme.blueDark,
                  color: AppTheme.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
