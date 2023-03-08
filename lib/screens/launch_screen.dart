import 'package:flutter/material.dart';
import 'package:note_app/utils/sizes_in_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_router.dart';
import '../routes/screen_name.dart';
import '../utils/images_constant.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});


  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  getUser()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var email=prefs.getString("email");
    print(email);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () => AppRouter.goToAndRemove(screenName:getUser() == null ? ScreenName.signInScreen:ScreenName.homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageConstant.logo, height: AppSizes.logoSizeLaunch),
      ),
    );
  }
}
