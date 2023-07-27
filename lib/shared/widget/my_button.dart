import 'package:flutter/material.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/sizes_in_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(AppColor.linearGradientColorB),
                Color(AppColor.linearGradientColorA),
              ])),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
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
