import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scube_task/src/core/assets/app_assets.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.leadingButtonOnTap});

  final VoidCallback? leadingButtonOnTap;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.secondary,
        height: kToolbarHeight,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: widget.leadingButtonOnTap,
              child: SvgPicture.asset(AppAssets.appbarBackIcon),
            ),

            //const SizedBox(width: 12),
            Text(
              "SCM",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.backButtonColor,
              ),
            ),

            //const SizedBox(width: 12),
            SvgPicture.asset(AppAssets.appbarBellIcon),
          ],
        ),
      ),
    );
  }
}
