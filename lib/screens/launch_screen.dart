import 'package:flutter/material.dart';
import 'package:note_app/utils/sizes_in_app.dart';
import 'package:provider/provider.dart';
import '../provider/AuthProvider.dart';
import '../routes/app_router.dart';
import '../routes/screen_name.dart';
import '../utils/images_constant.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});


  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  Widget build(BuildContext context) {
    final isLoggedIn =
        context.select<AuthProvider, bool>((provider) => provider.isLoggedIn);
    print('$isLoggedIn');

    Future.delayed(
        const Duration(seconds: 3),
            () => AppRouter.goToAndRemove(screenName:isLoggedIn?ScreenName.homeScreen:ScreenName.signInScreen)
    );
    return Scaffold(
      body: Center(
        child: Image.asset(ImageConstant.logo, height: AppSizes.logoSizeLaunch),
      ),
    );
  }
}
