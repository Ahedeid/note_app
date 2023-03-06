import 'package:flutter/material.dart';
import 'package:note_app/screens/widget/my_button.dart';
import 'package:note_app/screens/widget/my_textFeild.dart';
import 'package:note_app/screens/widget/sheared_appbar.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';

import '../utils/strings_in_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  var midea = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ShearedAppBar(),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.emptyImage),
            const SizedBox(height: 5),
            const Text(
              AppStrings.emptyText,
              style: TextStyle(
                  fontSize: AppSizes.sizeTextEmptyNote,
                  color: Color(AppColor.primaryTextColor)),
            ),
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: MyFloating(),
      ),
    );
  }
}



class MyFloating extends StatelessWidget {
  const MyFloating({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return FloatingActionButton(
      backgroundColor: const Color(AppColor.floatingColor),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 28,
      ),
      onPressed: () {
        showModalBottomSheet(
         shape: const OutlineInputBorder(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
         ),
          backgroundColor: const Color(AppColor.backGroundBottomSheet),
            context: context,
            isScrollControlled: true,
            builder: (context) => SizedBox(
              height: midea.height*0.55,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(' Add Note',
                            style: TextStyle(
                                fontSize: AppSizes.sizeTextEmptyNote,
                                color: Color(AppColor.grayColor))),
                        Text(''),
                      ],
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      hintText: ' Add Note',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      icon: '',
                      vertical: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                      Text(''),
                      Text('58/100',
                        style: TextStyle(
                          color: Color(AppColor.grayColor)) ,),
                    ],),
                    const SizedBox(height: 20),
                    MyButton(routeName: '', title: 'Save'),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
