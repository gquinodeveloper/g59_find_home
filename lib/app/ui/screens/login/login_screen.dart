import 'package:flutter/material.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/screens/login/login_controller.dart';
import 'package:g59_find_home/app/ui/screens/login/widgets/content.dart';
import 'package:g59_find_home/app/ui/screens/login/widgets/header.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  Header(),
                  Content(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
