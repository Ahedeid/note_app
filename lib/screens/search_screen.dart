import 'package:flutter/material.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            height: 60,
            width: double.infinity,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search by the keyword...',
                errorStyle: const TextStyle(fontSize: 12, height: 0.3),
                hintStyle: const TextStyle(color: Color(AppColor.grayColor)),
                filled: true,
                fillColor: const Color(AppColor.backGroundTextFieldColor),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  color: const Color(AppColor.grayColor),
                  onPressed: () => Navigator.pop(context),
                ),
                icon: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.only(left: 6),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(AppColor.backGroundTextFieldColor),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(AppColor.primaryTextColor),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              //  autofocus: true ,
            ),
          ),
          SizedBox(height: midea.height * 0.16),
          Image.asset(ImageConstant.emptySearch),
          const SizedBox(height: 15),
          const Text(
            'File not found. Try searching again.',
            style: TextStyle(
                fontSize: AppSizes.sizeTextEmptyNote,
                color: Color(AppColor.primaryTextColor)),
          )
        ],
      ),
    ));
  }
}
