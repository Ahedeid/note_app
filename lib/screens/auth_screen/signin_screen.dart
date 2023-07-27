import 'package:flutter/material.dart';
import 'package:note_app/provider/AuthProvider.dart';
import 'package:note_app/routes/app_router.dart';
import 'package:note_app/routes/screen_name.dart';
import 'package:note_app/shared/widget/my_button.dart';
import 'package:note_app/shared/widget/my_textFeild.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';
import 'package:provider/provider.dart';

import 'package:note_app/utils/extnsions_validation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  savePref()async{
 await Provider.of<AuthProvider>(context,listen: false).login(_emailController.text , _passwordController.text);
 AppRouter.goToAndRemove(screenName: ScreenName.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: midea.height * 0.11),
                const Text.rich(
                  TextSpan(
                    text: 'Welcome ',
                    style: TextStyle(
                        fontSize: AppSizes.sizeTextPrimary,
                        color: Color(AppColor.primaryTextColor)),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'back',
                        style: TextStyle(
                          color: Color(AppColor.tealColor),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 170,
                    width: 170,
                    child: Image.asset(ImageConstant.logo)),
                SizedBox(height: midea.height * 0.03),
                MyTextField(
                  controller:_emailController ,
                  validator: (val) {
                    if (!val!.isValidEmail) return 'Enter valid email';
                  },
                  hintText: 'email@hotmail.com',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  icon: IconsConstant.email,
                ),
                SizedBox(height: midea.height * 0.02),
                MyTextField(
                  controller: _passwordController,
                  validator: (val) {
                    if (!val!.isValidPassword && val.isEmpty) {
                      return 'Enter valid password';
                    }
                  },
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
                            color: Color(AppColor.grayColor)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: midea.height * 0.015),
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try{
                        savePref();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Welcome to App!')),
                        );

                      }catch(e){
                        debugPrint(e.toString());
                      }
                    }
                  },
                  title: 'Login',
                ),
                SizedBox(height: midea.height * 0.14),
                InkWell(
                  onTap: () => AppRouter.goToAndRemove(
                      screenName: ScreenName.signUpScreen),
                  child: const Text.rich(
                    TextSpan(
                      text: 'Have an account?  ',
                      style: TextStyle(
                          fontSize: AppSizes.sizeTextMedium,
                          color: Color(AppColor.grayColor)),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Sign Up',
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
