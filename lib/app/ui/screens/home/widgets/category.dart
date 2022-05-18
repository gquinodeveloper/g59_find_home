import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/data/models/response/response_category_model.dart';
import 'package:g59_find_home/app/ui/screens/home/home_controller.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SliverToBoxAdapter(
        child: SizedBox(
          height: 100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _.selectedIndex(index);
                },
                child: ItemCategory(
                  category: categories[index],
                  index: index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  ItemCategory({
    required this.category,
    required this.index,
  });

  final ResponseCategoryModel? category;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Obx(
        () {
          bool isSelected = index == _.isSelectedIndex.value ? true : false;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 85.w,
            margin: EdgeInsets.only(
              left: isSelected ? 20.w : 11.w,
              bottom: isSelected ? 0 : 20.h,
            ),
            decoration: BoxDecoration(
              color: index == _.isSelectedIndex.value
                  ? AppTheme.cyan
                  : Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  category!.path ?? "",
                  width: 30.w,
                  color: isSelected
                      ? Colors.white
                      : AppTheme.light.withOpacity(.5),
                ),
                isSelected
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            right: 5.w,
                            left: 5.w,
                          ),
                          child: Text(
                            category!.name ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
