import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/widgets/sliver_header_delegate.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      //floating: true,
      pinned: true,
      delegate: SliverHeaderDelegate(
        maxHeight: 70.h,
        minHeight: 70.h,
        child: Container(
          color: AppTheme.background,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: SvgPicture.asset('assets/icons/search-home.svg'),
                ),
                Expanded(
                  child: CupertinoTextField(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    placeholder: 'What are you looking for?',
                    placeholderStyle:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppTheme.searchColor,
                              fontWeight: FontWeight.w100,
                            ),
                    cursorColor: AppTheme.searchColor,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: AppTheme.searchColor,
                          fontWeight: FontWeight.w100,
                        ),
                  ),
                ),
                Icon(
                  Icons.settings_input_component_outlined,
                  color: AppTheme.blueDark,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
