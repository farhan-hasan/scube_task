import 'package:flutter/material.dart';
import 'package:scube_task/src/core/constants/app_constants.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/scm/data/dummy_analytics_data.dart';
import 'package:scube_task/src/features/scm/presentation/screens/no_data_screen.dart';
import 'package:scube_task/src/features/scm/presentation/screens/scm_analytics_details_screen.dart';
import 'package:scube_task/src/features/scm/presentation/widgets/source_load_list_item.dart';
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
    analyticTabController.addListener(resetScrollPosition);
    sourceLoadTabController = TabController(
      length: 2,
      vsync: this,
      //animationDuration: Duration.zero,
    );
    sourceLoadTabController.addListener(resetScrollPosition);
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  void resetScrollPosition() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
      scrollThumbOffset.value = 0.0;
      isScrolledToBottom.value = false;
    }
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final listHeight = constraints.maxHeight;
        final availableThumbTravel = listHeight - AppSizes.scrollThumbHeight;

        return Stack(
          children: [
            // Data list
            ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.only(right: AppSpacing.md),
              itemCount: DummyAnalyticsData.sourceLoadData.length,
              separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final sourceLoadData = DummyAnalyticsData.sourceLoadData[index];
                return SourceLoadListItem(
                  data: sourceLoadData,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScmAnalyticsDetailsScreen(),
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
                width: AppSizes.scrollThumbWidth,
                decoration: BoxDecoration(
                  color: AppColors.boxBorderColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
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
                    width: AppSizes.scrollThumbWidth,
                    height: AppSizes.scrollThumbHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.scrollThumbGradientColorOne,
                          AppColors.scrollThumbGradientColorTwo,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                  ),
                );
              },
            ),
            // Bottom shadow indicator
            Positioned(
              bottom: 0,
              left: 0,
              right: AppSpacing.md,
              child: IgnorePointer(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isScrolledToBottom,
                  builder: (context, isScrolledToBottom, child) {
                    return AnimatedOpacity(
                      opacity: isScrolledToBottom ? 0.0 : 1.0,
                      duration: AppDurations.fast,
                      child: Container(
                        height: AppSpacing.huge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSizes.radiusSm),
                            bottomRight: Radius.circular(AppSizes.radiusSm),
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
