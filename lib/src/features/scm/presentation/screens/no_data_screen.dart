import 'package:flutter/material.dart';
import 'package:scube_task/src/core/assets/app_assets.dart';
import 'package:scube_task/src/core/constants/app_constants.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/shared/widgets/custom_appbar.dart';

class NoDataScreen extends StatefulWidget {
  const NoDataScreen({super.key});

  @override
  State<NoDataScreen> createState() => _NoDataScreenState();
}

class _NoDataScreenState extends State<NoDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingButtonOnTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Stack(
        children: [
          /// BG color
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.scaffoldBackground,
          ),

          /// Content
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(
              right: AppSpacing.xxl,
              left: AppSpacing.xxl,
              top: AppSpacing.md,
              bottom: AppSpacing.xxl,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              border: Border.all(
                color: AppColors.boxBorderColor,
                width: AppSizes.borderWidth,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 148),
                Image.asset(AppAssets.noDataIcon),
                const SizedBox(height: AppSpacing.md),
                Text(
                  "No data is here,",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.grey),
                ),
                Text(
                  "please wait.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
