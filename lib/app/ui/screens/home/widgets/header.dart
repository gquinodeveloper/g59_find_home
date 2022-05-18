import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/screens/home/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              _SliverAppBar(),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              _WelcomeUser(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            foregroundImage: NetworkImage(
                "https://i.pinimg.com/474x/98/6d/69/986d69105df94498ea96e53a7495de19.jpg"),
          ),
          Obx(
            () => RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10..w),
                      child: SvgPicture.asset(
                        "assets/icons/location.svg",
                        width: 12.w,
                      ),
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: "${_.address}",
                    style: Theme.of(context).textTheme.button?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w600),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppTheme.blueDark,
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: SvgPicture.asset(
                    "assets/icons/bell.svg",
                    width: 18.w,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: SvgPicture.asset(
                      "assets/icons/setting.svg",
                      width: 18.w,
                    ),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(
            () => Text(
              "Hi ${_.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black38, fontWeight: FontWeight.w200),
            ),
          ),
          Text(
            "Start Looking for u house",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppTheme.blueDark, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
