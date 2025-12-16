import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/dummy_analytics_data.dart';
import 'package:scube_task/src/features/scm/presentation/screens/no_data_screen.dart';
import 'package:scube_task/src/features/scm/presentation/screens/scm_analytics_details_screen.dart';
import 'package:scube_task/src/features/shared/widgets/custom_appbar.dart';

class ScmAnalyticsScreen extends StatefulWidget {
  const ScmAnalyticsScreen({super.key});

  @override
  State<ScmAnalyticsScreen> createState() => _ScmAnalyticsScreenState();
}

class _ScmAnalyticsScreenState extends State<ScmAnalyticsScreen>
    with TickerProviderStateMixin {
  late TabController analyticTabController;
  late TabController sourceLoadTabController;
  late ScrollController scrollController;
  final ValueNotifier<bool> isScrolledToBottom = ValueNotifier(false);
  final ValueNotifier<double> scrollThumbOffset = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    analyticTabController = TabController(
      length: 3,
      vsync: this,
      //animationDuration: Duration.zero,
    );
    sourceLoadTabController = TabController(
      length: 2,
      vsync: this,
      //animationDuration: Duration.zero,
    );
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.hasClients) {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      final isAtBottom = currentScroll >= maxScroll;

      if (isScrolledToBottom.value != isAtBottom) {
        isScrolledToBottom.value = isAtBottom;
      }

      // Update thumb position
      if (maxScroll > 0) {
        scrollThumbOffset.value = currentScroll / maxScroll;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    isScrolledToBottom.dispose();
    scrollThumbOffset.dispose();
    analyticTabController.dispose();
    sourceLoadTabController.dispose();
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      /// Analytics box
                      Container(
                        height: 537,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.boxBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: TabBar(
                                controller: analyticTabController,
                                indicator: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                labelColor: AppColors.secondary,
                                unselectedLabelColor:
                                    AppColors.unselectedTabTextColor,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: AppColors.secondary),
                                unselectedLabelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColors.unselectedTabTextColor,
                                    ),
                                dividerColor: AppColors.tabBarDividerColor,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(text: "Summary"),
                                  Tab(text: "SLD"),
                                  Tab(text: "Data"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: analyticTabController,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  buildTabContent(),
                                  buildTabContent(),
                                  buildTabContent(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Info Cards
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: DummyAnalyticsData.analyticsInfoCards.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 8,
                              mainAxisExtent: 42,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          final card =
                              DummyAnalyticsData.analyticsInfoCards[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const NoDataScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.boxBorderColor,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(card.getIconPath),
                                  const SizedBox(width: 8),
                                  Text(
                                    card.getTitle,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTabContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        children: [
          Text(
            'Electricity',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 16,
              color: AppColors.lightGrey,
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: AppColors.lightGrey),
          const SizedBox(height: 14),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.totalPowerSliderColor,
                width: 20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Power",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.backButtonColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "5.53 kw",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.backButtonColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.tabBarBackgroundColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            height: 32,
            child: TabBar(
              controller: sourceLoadTabController,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              labelColor: AppColors.secondary,
              unselectedLabelColor: AppColors.unselectedTabTextColor,
              labelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.secondary,
                fontSize: 16,
              ),
              unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: AppColors.unselectedTabTextColor),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: "Source"),
                Tab(text: "Load"),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Divider(color: AppColors.lightGrey),
          const SizedBox(height: 4),
          Expanded(
            child: TabBarView(
              controller: sourceLoadTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [buildSourceLoadList(), buildSourceLoadList()],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSourceLoadList() {
    const double thumbHeight = 33.0;
    const double thumbWidth = 4.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final listHeight = constraints.maxHeight;
        final availableThumbTravel = listHeight - thumbHeight;

        return Stack(
          children: [
            // Data list
            ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.only(right: 12),
              itemCount: DummyAnalyticsData.sourceLoadData.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final sourceLoadData = DummyAnalyticsData.sourceLoadData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScmAnalyticsDetailsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.tabBarBackgroundColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AppColors.boxBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // icon
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(sourceLoadData.getIconPath),
                        ),
                        // data
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  color: sourceLoadData.getColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  sourceLoadData.getTitle,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: AppColors.backButtonColor,
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "(${sourceLoadData.isActive ? "Active" : "Inactive"})",
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        color: sourceLoadData.isActive
                                            ? AppColors.primary
                                            : AppColors
                                                  .notificationIndicatorColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text.rich(
                              TextSpan(
                                text: 'Data 1    : ',
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                                  TextSpan(
                                    text: sourceLoadData.getDataOne.toString(),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: AppColors.backButtonColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text.rich(
                              TextSpan(
                                text: 'Data 2    : ',
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                                  TextSpan(
                                    text: sourceLoadData.getDataTwo.toString(),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: AppColors.backButtonColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // arrow
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.grey,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Scrollbar track
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: thumbWidth,
                decoration: BoxDecoration(
                  color: AppColors.boxBorderColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            // Custom gradient scrollbar thumb
            ValueListenableBuilder<double>(
              valueListenable: scrollThumbOffset,
              builder: (context, offset, child) {
                final thumbPosition = availableThumbTravel * offset;

                return Positioned(
                  right: 0,
                  top: thumbPosition,
                  child: Container(
                    width: thumbWidth,
                    height: thumbHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.scrollThumbGradientColorOne,
                          AppColors.scrollThumbGradientColorTwo,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
            ),
            // Bottom shadow indicator
            Positioned(
              bottom: 0,
              left: 0,
              right: 12,
              child: IgnorePointer(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isScrolledToBottom,
                  builder: (context, isScrolledToBottom, child) {
                    return AnimatedOpacity(
                      opacity: isScrolledToBottom ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
