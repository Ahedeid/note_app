import 'package:flutter/material.dart';
import 'package:note_app/utils/sizes_in_app.dart';

import '../routes/app_router.dart';
import '../routes/screen_name.dart';
import '../utils/images_constant.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => AppRouter.goToAndRemove(screenName: ScreenName.signInScreen),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(ImageConstant.logo, height: AppSizes.logoSizeLaunch),
      ),
    );
  }
}
