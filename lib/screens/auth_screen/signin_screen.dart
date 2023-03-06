import 'package:flutter/material.dart';
import 'package:note_app/screens/widget/my_textFeild.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';

import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';
import '../widget/my_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size ;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height:midea.height * 0.11),
              const Text.rich(
                  TextSpan(
                      text: 'Welcome ',
                      style: TextStyle(fontSize: AppSizes.sizeTextPrimary
                          ,color: Color(AppColor.primaryTextColor)
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'back',style: TextStyle(color: Color(AppColor.tealColor),
                        )
                        )
                      ]
                  )
              ),
              SizedBox(
                  height: 170,
                  width: 170,
                  child: Image.asset(ImageConstant.logo)),
              SizedBox(height:midea.height * 0.03),
              MyTextField(
                hintText: 'email@hotmail.com',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                icon: IconsConstant.email,
              ),
               SizedBox(height: midea.height * 0.02),
              MyTextField(
                hintText: 'Password',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                icon: IconsConstant.lock,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        fontSize: AppSizes.sizeTextMedium,
                        color: Color(AppColor.grayColor)
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(height: midea.height * 0.03),
              MyButton(routeName: ScreenName.homeScreen, title: 'Login',),
              SizedBox(height:midea.height * 0.15),
              InkWell(
                onTap: ()=> AppRouter.goToAndRemove(screenName: ScreenName.signUpScreen),
                child: const Text.rich(
                    TextSpan(
                        text: 'Have an account?  ',
                        style: TextStyle(fontSize: AppSizes.sizeTextMedium
                            ,color: Color(AppColor.grayColor)
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Sign Up',style: TextStyle(color: Color(AppColor.tealColor),
                          )
                          )
                        ]
                    )
                ),
              ),

           ],
          ),
        ),
      ),
    );
  }
}


