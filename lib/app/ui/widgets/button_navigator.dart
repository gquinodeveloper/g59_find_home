import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';

class ButtonNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.1,
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        decoration: BoxDecoration(
          color: AppTheme.blueDark,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: itemsBottonNavigation.map((item) {
            final index = itemsBottonNavigation.indexOf(item);
            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: SvgPicture.asset(
                    item,
                    width: index == 0 ? 20.w : 18.w,
                    color: index == 0 ? AppTheme.cyan : Colors.white54,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
