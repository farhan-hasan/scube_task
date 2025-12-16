import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube_task/src/core/assets/app_assets.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/dummy_analytics_data.dart';
import 'package:scube_task/src/features/scm/presentation/screens/no_data_screen.dart';
import 'package:scube_task/src/features/scm/presentation/widgets/circular_progress_painter.dart';
import 'package:scube_task/src/features/shared/widgets/custom_appbar.dart';

class ScmAnalyticsDetailsScreen extends StatefulWidget {
  const ScmAnalyticsDetailsScreen({super.key});

  @override
  State<ScmAnalyticsDetailsScreen> createState() =>
      _ScmAnalyticsDetailsScreenState();
}

class _ScmAnalyticsDetailsScreenState extends State<ScmAnalyticsDetailsScreen>
    with TickerProviderStateMixin {
  late TabController viewTabController;
  late TabController dataTabController;

  @override
  void initState() {
    super.initState();
    viewTabController = TabController(
      length: 2,
      vsync: this,
      //animationDuration: Duration.zero,
    );
    viewTabController.addListener(() {
      setState(() {});
    });
    dataTabController = TabController(
      length: 2,
      vsync: this,
      //animationDuration: Duration.zero,
    );
    dataTabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    viewTabController.dispose();
    dataTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingButtonOnTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(
        color: AppColors.scaffoldBackground,
        child: Stack(
          children: [
            // White container
            Positioned(
              top: 40,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border.all(color: AppColors.boxBorderColor, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TabBarView(
                    controller: viewTabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [buildTabContent(), buildTabContent()],
                  ),
                ),
              ),
            ),
            // TabBar
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.boxBorderColor, width: 1),
                ),
                height: 48,
                child: TabBar(
                  controller: viewTabController,
                  indicator: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.unselectedTabTextColor,
                  labelStyle: Theme
                      .of(
                    context,
                  )
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.primary, fontSize: 16),
                  unselectedLabelStyle: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.unselectedTabTextColor),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.bulletPointIcon,
                            colorFilter: ColorFilter.mode(
                              viewTabController.index == 0
                                  ? AppColors.primary
                                  : AppColors.unselectedTabTextColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text("Data View"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.bulletPointIcon,
                            colorFilter: ColorFilter.mode(
                              viewTabController.index == 1
                                  ? AppColors.primary
                                  : AppColors.unselectedTabTextColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text("Revenue View"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            width: 160,
            height: 130,
            child: CustomPaint(
              painter: CircularProgressPainter(
                progress: 0.60,
                strokeWidth: 20,
                backgroundColor: AppColors.boxBorderColor,
                progressColor: AppColors.totalPowerSliderColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "55.00",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(
                        color: AppColors.backButtonColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "kWh/Sqft",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                        color: AppColors.backButtonColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 18,
            child: TabBar(
              controller: dataTabController,
              indicator: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.unselectedTabTextColor,
              labelStyle: Theme
                  .of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                color: AppColors.primary,
              ),
              unselectedLabelStyle: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.unselectedTabTextColor),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        height: 10,
                        width: 10,
                        AppAssets.bulletPointIcon,
                        colorFilter: ColorFilter.mode(
                          dataTabController.index == 0
                              ? AppColors.primary
                              : AppColors.unselectedTabTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text("Today Data"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        height: 10,
                        width: 10,
                        AppAssets.bulletPointIcon,
                        colorFilter: ColorFilter.mode(
                          dataTabController.index == 1
                              ? AppColors.primary
                              : AppColors.unselectedTabTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text("Custom Date Data"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: dataTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [buildTodayData(), buildCustomDateData()],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTodayData() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.boxBorderColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Energy Chart", style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,),
                Text("5.53 kw", style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 32),),
              ],
            ),
            const SizedBox(height: 20,),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: DummyAnalyticsData.dataCostList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final dataCost = DummyAnalyticsData.dataCostList[index];
                return Container(
                  height: 42,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.boxBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // title
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, color: dataCost.color, size: 8,),
                          const SizedBox(height: 2,),
                          Text(dataCost.title, style: Theme
                              .of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 12),)
                        ],
                      ),
                      const SizedBox(width: 8),
                      VerticalDivider(
                        color: AppColors.boxBorderColor,
                        thickness: 1,
                        width: 1,
                      ),
                      // data
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Data    : ',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                              children: [
                                TextSpan(
                                  text: dataCost.data,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                      color: AppColors.backButtonColor,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text.rich(
                            TextSpan(
                              text: 'Cost    : ',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                              children: [
                                TextSpan(
                                  text: dataCost.cost,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                      color: AppColors.backButtonColor,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildCustomDateData() {
    return Column(
      children: [
        // Date selectors row (fixed at top)
        Row(
          children: [
            // From date selector
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.boxBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From Date",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: AppColors.unselectedTabTextColor,
                        ),
                      ),
                      SvgPicture.asset(AppAssets.calendarIcon)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // To date selector
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.boxBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To Date",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: AppColors.unselectedTabTextColor,
                        ),
                      ),
                      SvgPicture.asset(AppAssets.calendarIcon)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Search button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.extraLightGrey,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(AppAssets.searchIcon, height: 18,),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // First data container
                buildDataContainer("Energy Chart", "5.53 kw"),
                const SizedBox(height: 16),
                // Second data container
                buildDataContainer("Cost Chart", "20.05 kw"),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDataContainer(String title, String value) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.boxBorderColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title, style: Theme.of(context).textTheme.displayMedium),
              Text(value, style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 32)),
            ],
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: DummyAnalyticsData.dataCostList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final dataCost = DummyAnalyticsData.dataCostList[index];
              return Container(
                height: 42,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.boxBorderColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, color: dataCost.color, size: 8),
                        const SizedBox(height: 2),
                        Text(
                          dataCost.title,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    VerticalDivider(
                      color: AppColors.boxBorderColor,
                      thickness: 1,
                      width: 1,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Data    : ',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: dataCost.data,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: AppColors.backButtonColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            text: 'Cost    : ',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: dataCost.cost,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: AppColors.backButtonColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
