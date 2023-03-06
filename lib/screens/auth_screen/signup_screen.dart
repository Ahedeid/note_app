import 'package:flutter/material.dart';
import 'package:note_app/screens/widget/my_button.dart';
import 'package:note_app/screens/widget/my_textFeild.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';

import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: midea.height * 0.1),
              const Text.rich(TextSpan(
                  text: 'Sign ',
                  style: TextStyle(
                      fontSize: AppSizes.sizeTextPrimary,
                      color: Color(AppColor.primaryTextColor)),
                  children: <InlineSpan>[
                    TextSpan(
                        text: 'Up',
                        style: TextStyle(
                          color: Color(AppColor.tealColor),
                        ))
                  ])),
              SizedBox(height: midea.height * 0.01),
              const Text(
                'Create a new account!',
                style: TextStyle(
                    fontSize: AppSizes.sizeSubText,
                    color: Color(AppColor.grayColor)),
              ),
              SizedBox(height: midea.height * 0.03),
              MyTextField(
                hintText: 'full Name',
                obscureText: false,
                keyboardType: TextInputType.name,
                icon: IconsConstant.profile,
              ),
              SizedBox(height: midea.height * 0.02),
              MyTextField(
                hintText: 'email@hotmail.com',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                icon: IconsConstant.email,
              ),
              SizedBox(height: midea.height * 0.02),
              MyTextField(
                hintText: 'Phone number',
                obscureText: false,
                keyboardType: TextInputType.phone,
                icon: '+ 99',
              ),
              SizedBox(height: midea.height * 0.02),
              MyTextField(
                hintText: 'Password',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                icon: IconsConstant.lock,
              ),
              SizedBox(height: midea.height * 0.02),
              MyTextField(
                hintText: 'Confirm password',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                icon: IconsConstant.lock,
              ),
              SizedBox(height: midea.height * 0.03),
              MyButton(routeName: '', title: 'Sign UP'),
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
    );
  }
}
