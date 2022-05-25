import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/ui/screens/login/login_controller.dart';
import 'package:g59_find_home/app/ui/widgets/btn_primary.dart';
import 'package:g59_find_home/app/ui/widgets/input_text.dart';
import 'package:get/get.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: EdgeInsets.only(bottom: constraint.maxHeight * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  "Login form enjoy findhome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 50.h),
                InputText(
                  iconPrefix: Icons.email_outlined,
                  iconColor: AppTheme.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  filled: false,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppTheme.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  onChanged: _.onChangeEmail,
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => InputText(
                    iconPrefix: Icons.lock,
                    iconColor: AppTheme.light,
                    border: InputBorder.none,
                    keyboardType: TextInputType.text,
                    labelText: "Password",
                    filled: false,
                    obscureText: _.isObscureText.value,
                    maxLines: 1,
                    enabledBorderColor: Colors.black26,
                    focusedBorderColor: AppTheme.cyan,
                    fontSize: 14.0,
                    fontColor: Colors.black45,
                    suffixIcon: GestureDetector(
                      onTap: _.showPassword,
                      child: _.isObscureText.value
                          ? Icon(
                              Icons.visibility_off_rounded,
                              color: AppTheme.light,
                            )
                          : Icon(
                              Icons.visibility,
                              color: AppTheme.light,
                            ),
                    ),
                    onChanged: _.onChangePassword,
                  ),
                ),
                SizedBox(height: 30.h),
                BtnPrimary(
                  text: "Sign in",
                  onPressed: _.doAuth,
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _.openWhatsApp();
                      },
                      child: Text(
                        "Forgot password",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.black54),
                      ),
                    ),
                    GestureDetector(
                      onTap: _.goToRegister,
                      child: Text(
                        "Create new account",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: AppTheme.blueDark,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
