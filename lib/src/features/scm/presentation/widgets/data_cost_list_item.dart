import 'package:flutter/material.dart';
import 'package:scube_task/src/core/constants/app_constants.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/models/data_cost.dart';

class DataCostListItem extends StatelessWidget {
  final DataCost dataCost;

  const DataCostListItem({
    super.key,
    required this.dataCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd - 2),
        border: Border.all(
          color: AppColors.boxBorderColor,
          width: AppSizes.borderWidth,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: dataCost.color, size: AppSpacing.sm),
              const SizedBox(height: 2),
              Text(
                dataCost.title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 12,
                    ),
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.sm),
          VerticalDivider(
            color: AppColors.boxBorderColor,
            thickness: AppSizes.borderWidth,
            width: AppSizes.borderWidth,
          ),
          const SizedBox(width: AppSpacing.sm),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDataText(context, 'Data    : ', dataCost.data),
              const SizedBox(height: AppSpacing.xs),
              _buildDataText(context, 'Cost    : ', dataCost.cost),
            ],
          ),
        ],
      ),
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
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.backButtonColor,
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
