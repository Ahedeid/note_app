import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/utils/colors_manger.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.bottomMargin = 0,
    this.prefixIcon,
    //this.onSaved,
    this.height = 65,
    this.width = double.infinity,
    this.vertical = 20,
    // this.validator,
    // this.controller,
    required this.icon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final bool obscureText;
  double bottomMargin;
  final TextInputType keyboardType;


  // Function? validator;
  // Function? onSaved;
  // TextEditingController? controller;
  AutovalidateMode? autovalidateMode;
  Widget? prefixIcon;
  double height;
  double width;
  double vertical;
  String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      height: height,
      width: width,
      child: TextFormField(
        //   onSaved: onSaved as Function(String?)?,
        //  controller: controller,
        //    validator: validator as String? Function(String?)?,
        keyboardType: keyboardType,
        autovalidateMode: autovalidateMode,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            errorStyle: const TextStyle(fontSize: 12, height: 0.3),
            hintStyle: const TextStyle(color: Color(AppColor.grayColor)),
            filled: true,
            fillColor: const Color(AppColor.backGroundTextFieldColor),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 34, vertical: vertical),
            prefixIcon: SvgPicture.asset(
                    icon,
                    fit: BoxFit.scaleDown,
                  ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(AppColor.tealColor)),
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red))),
        //  autofocus: true ,
      ),
    );
  }
}
