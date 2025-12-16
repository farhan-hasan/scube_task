import 'package:flutter/material.dart';
import 'package:scube_task/src/core/constants/app_constants.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/models/source_load_data.dart';

class SourceLoadListItem extends StatelessWidget {
  final SourceLoadData data;
  final VoidCallback onTap;

  const SourceLoadListItem({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.tabBarBackgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          border: Border.all(
            color: AppColors.boxBorderColor,
            width: AppSizes.borderWidth,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: AppSizes.iconMd,
              width: AppSizes.iconMd,
              child: Image.asset(data.getIconPath),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleRow(context),
                  const SizedBox(height: AppSpacing.xs),
                  _buildDataText(context, 'Data 1    : ', data.getDataOne.toString()),
                  const SizedBox(height: AppSpacing.xs),
                  _buildDataText(context, 'Data 2    : ', data.getDataTwo.toString()),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
              size: AppSizes.iconSm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Row(
      children: [
        Container(
          height: AppSpacing.md,
          width: AppSpacing.md,
          color: data.getColor,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          data.getTitle,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 14,
                color: AppColors.backButtonColor,
              ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          "(${data.isActive ? "Active" : "Inactive"})",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 10,
                color: data.isActive
                    ? AppColors.primary
                    : AppColors.notificationIndicatorColor,
              ),
        ),
      ],
    );
  }

  Widget _buildDataText(BuildContext context, String label, String value) {
    return Text.rich(
      TextSpan(
        text: label,
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.backButtonColor,
                ),
          ),
        ],
      ),
    );
  }
}
