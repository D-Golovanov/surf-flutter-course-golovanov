import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/bottom_bar.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:places/ui/widgets/sight_card.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({super.key});

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CenterAppBar(
          title: AppStrings.appTitleFavorites,
          bottomWidgetHeigth: 52.0,
          bottomWidget: CustomTabBar(),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              itemCount: mocks.length,
              itemBuilder: (context, index) {
                return SightCard(
                  sight: mocks[index],
                  type: CardType.wantVisitPlaning,
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              itemCount: mocks.length,
              itemBuilder: (context, index) {
                return SightCard(
                  sight: mocks[index],
                  type: CardType.visited,
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroung,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: TabBar(
        indicator: BoxDecoration(
          color: AppColors.darkTextBlue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        indicatorWeight: 0.0,
        unselectedLabelColor: AppColors.lightTextBlue.withOpacity(0.56),
        labelStyle: AppTypography.text14Category,
        splashBorderRadius: BorderRadius.circular(20.0),
        tabs: const [
          Tab(
            text: AppStrings.tabBarWantToVisit,
            height: 40.0,
          ),
          Tab(
            text: AppStrings.tabBarVisited,
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
