import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../utils/colors_manger.dart';
import '../../utils/sizes_in_app.dart';



class MyButton extends StatelessWidget {
  MyButton({
    required this.routeName,required this.title,
    super.key,
  });
  String routeName;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 48,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(AppColor.linearGradientColorB),
                Color(AppColor.linearGradientColorA),
              ]
          )
      ),
      child: ElevatedButton(
        onPressed: ()=> AppRouter.goToAndRemove(screenName: routeName),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child:  Text(
          title,
          style: const TextStyle(
            fontSize: AppSizes.sizeTextMedium,
            color: Color(AppColor.primaryTextColor),
          ),
        ),
      ),
    );
  }
}