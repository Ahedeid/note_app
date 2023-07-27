import 'package:flutter/material.dart';
import 'package:note_app/routes/app_router.dart';
import 'package:note_app/routes/screen_name.dart';
import 'package:note_app/utils/colors_manger.dart';
import 'package:note_app/utils/images_constant.dart';
import 'package:note_app/utils/sizes_in_app.dart';

class ShearedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShearedAppBar({
    Key? key,
    required this.title,
    this.showIcon = true,
  }) : super(key: key);
  final String title;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: AppSizes.hightAppBar,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: AppSizes.sizeTextPrimary,
            color: Color(AppColor.primaryTextColor)),
      ),
      actions: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(AppColor.backGroundSearchIconColor),
          child: IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(AppColor.tealColor),
            ),
            onPressed: () =>
                AppRouter.goTo(screenName: ScreenName.searchScreen),
          ),
        ),
        const SizedBox(width: 10),
        showIcon
            ? CircleAvatar(
                radius: 25,
                backgroundColor:
                    const Color(AppColor.backGroundSearchIconColor),
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Color(AppColor.tealColor),
                  ),
                  onPressed: () =>
                      AppRouter.goTo(screenName: ScreenName.favoriteScreen),
                ),
              )
            : const SizedBox(),
        const SizedBox(width: 10),
        Image.asset(
          ImageConstant.logo,
          height: AppSizes.sizeLogoAppBar,
          width: AppSizes.sizeLogoAppBar,
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.hightAppBar);
}
