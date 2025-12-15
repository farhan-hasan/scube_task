import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube_task/src/core/assets/app_assets.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/dummy_analytics_data.dart';
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
          // Analytics box
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(right: 24, left: 24, top: 12, bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.boxBorderColor, width: 1),
            ),
            child: Column(
              children: [
                const SizedBox(height: 148),
                Image.asset(AppAssets.noDataIcon),
                const SizedBox(height: 12),
                Text(
                  "No data is here,",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey),
                ),
                Text(
                  "please wait.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
