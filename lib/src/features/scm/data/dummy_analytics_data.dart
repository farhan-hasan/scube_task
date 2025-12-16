import 'package:scube_task/src/core/assets/app_assets.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/models/analytics_info_card.dart';
import 'package:scube_task/src/features/scm/data/models/data_cost.dart';
import 'package:scube_task/src/features/scm/data/models/source_load_data.dart';

class DummyAnalyticsData {
  static final List<AnalyticsInfoCard> analyticsInfoCards = [
    AnalyticsInfoCard(
      title: "Analysis Pro",
      iconPath: AppAssets.chartIcon,
    ),
    AnalyticsInfoCard(
      title: "G. Generator",
      iconPath: AppAssets.generatorIcon,
    ),
    AnalyticsInfoCard(
      title: "Plant Summary",
      iconPath: AppAssets.chargeIcon,
    ),
    AnalyticsInfoCard(
      title: "Natural Gas",
      iconPath: AppAssets.fireIcon,
    ),
    AnalyticsInfoCard(
      title: "D. Generator",
      iconPath: AppAssets.generatorIcon,
    ),
    AnalyticsInfoCard(
      title: "Water Process",
      iconPath: AppAssets.faucetIcon,
    ),


  ];
  static final List<SourceLoadData> sourceLoadData = [
    SourceLoadData(title: "Data View", dataOne: 55505.63, dataTwo: 58805.63, iconPath: AppAssets.solarCellIcon, isActive: true, color: AppColors.blueDataColor),
    SourceLoadData(title: "Data 1", dataOne: 55505.63, dataTwo: 58805.63, iconPath: AppAssets.batteryIcon, isActive: true, color: AppColors.orangeDataColor),
    SourceLoadData(title: "Data 2", dataOne: 55505.63, dataTwo: 58805.63, iconPath: AppAssets.powerIcon, isActive: false, color: AppColors.blueDataColor),
    SourceLoadData(title: "Total Solar", dataOne: 55505.63, dataTwo: 58805.63, iconPath: AppAssets.solarCellIcon, isActive: true, color: AppColors.blueDataColor),
  ];
  static final List<DataCost> dataCostList = [
    DataCost(title: "Data A", data: "2798.50 (29.53%)", cost: "35689 ৳", color: AppColors.primary),
    DataCost(title: "Data B", data: "72598.50 (35.39%)", cost: "5259689 ৳", color: AppColors.blueDataColor),
    DataCost(title: "Data C", data: "6598.36 (83.90%)", cost: "5698756 ৳", color: AppColors.purpleDataColor),
    DataCost(title: "Data D", data: "6598.26 (36.59%)", cost: "356987 ৳", color: AppColors.orangeDataColor),
  ];




}