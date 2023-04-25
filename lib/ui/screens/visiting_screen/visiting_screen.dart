import 'package:flutter/material.dart';
import 'package:places/assets/strings.dart';
import 'package:places/ui/screens/visiting_screen/visiting_widgets.dart';
import 'package:places/ui/widgets/center_app_bar.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({super.key});

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CenterAppBar(
          title: AppStrings.appTitleFavorites,
          bottomWidgetHeigth: 52.0,
          bottomWidget: CustomTabBar(),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            ListBodyWantVisitWidget(),
            ListBodyVisited(),
          ],
        ),
      ),
    );
  }
}
