import 'package:flutter/material.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/screens/home/home_controller.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/category.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/condominum.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/header.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/houses.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/keys.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/offers.dart';
import 'package:g59_find_home/app/ui/screens/home/widgets/search.dart';
import 'package:g59_find_home/app/ui/widgets/button_navigator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    Header(),
                    Search(),
                    Category(),
                    Obx(
                      () {
                        switch (_.isSelectedIndex.value) {
                          case 0:
                            return Houses();
                          case 1:
                            return const Condominum();
                          case 2:
                            return const Keys();
                          case 3:
                            return const Offers();
                        }
                        return  Houses();
                      },
                    ),
                  ],
                ),
              ),
              ButtonNavigator()
            ],
          ),
        ),
      ),
    );
  }
}
