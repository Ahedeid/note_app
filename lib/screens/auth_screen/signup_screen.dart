import 'package:flutter/material.dart';
import 'package:note_app/routes/app_router.dart';
import 'package:note_app/routes/screen_name.dart';
import 'package:note_app/shared/widget/my_button.dart';
import 'package:note_app/shared/widget/my_textFeild.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';
import 'package:note_app/utils/validate_extension.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _signFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _signFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: midea.height * 0.1),
                const Text.rich(
                  TextSpan(
                    text: 'Sign ',
                    style: TextStyle(
                        fontSize: AppSizes.sizeTextPrimary,
                        color: Color(AppColor.primaryTextColor)),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Up',
                        style: TextStyle(
                          color: Color(AppColor.tealColor),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: midea.height * 0.01),
                const Text(
                  'Create a new account!',
                  style: TextStyle(
                      fontSize: AppSizes.sizeSubText,
                      color: Color(AppColor.grayColor)),
                ),
                SizedBox(height: midea.height * 0.03),
                MyTextField(
                  validator: (val) => val!.validateUserName(),
                  hintText: 'full Name',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  icon: IconsConstant.profile,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  validator: (val) => val!.validateEmail(),
                  hintText: 'email@hotmail.com',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  icon: IconsConstant.email,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  validator: (val) => val!.validatePhoneNumber(),
                  hintText: 'Phone number',
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  icon: IconsConstant.call,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  validator: (val) => val!.validatePassword(),
                  hintText: 'Password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  icon: IconsConstant.lock,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  validator: (val) => val!.validatePassword(),
                  hintText: 'Confirm password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  icon: IconsConstant.lock,
                ),
                SizedBox(height: midea.height * 0.03),
                CustomButton(
                    onPressed: () {
                      if (_signFormKey.currentState!.validate()) {
                        AppRouter.goToAndRemove(
                            screenName: ScreenName.homeScreen);
                      }
                    },
                    title: 'Sign UP'),
                SizedBox(height: midea.height * 0.09),
                InkWell(
                  onTap: () => AppRouter.goToAndRemove(
                      screenName: ScreenName.signInScreen),
                  child: const Text.rich(
                    TextSpan(
                      text: 'Have an account?  ',
                      style: TextStyle(
                          fontSize: AppSizes.sizeTextMedium,
                          color: Color(AppColor.grayColor)),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            color: Color(AppColor.tealColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
