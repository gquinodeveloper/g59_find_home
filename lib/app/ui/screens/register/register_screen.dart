import 'package:flutter/material.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/screens/register/register_controller.dart';
import 'package:g59_find_home/app/ui/screens/register/widgets/content.dart';
import 'package:g59_find_home/app/ui/screens/register/widgets/header.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Header(),
              Content(),
            ],
          ),
        ),
      ),
    );
  }
}
