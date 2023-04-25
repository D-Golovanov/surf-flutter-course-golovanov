import 'package:flutter/material.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/icon_button_card.dart';
import 'package:places/ui/widgets/sight_card.dart';

class ListBodyVisited extends StatelessWidget {
  const ListBodyVisited({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      itemCount: mocks.length,
      itemBuilder: (context, index) {
        return SightCard(
          sight: mocks[index],
          type: CardType.visited,
          childrenAction: [
            IconButtonCard(
              assetIconPath: AppAssets.share,
              onPressed: () {
                debugPrint('Press share');
              },
            ),
            IconButtonCard(
              assetIconPath: AppAssets.close,
              onPressed: () {
                debugPrint('Press clouse');
              },
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
    );
  }
}

class ListBodyWantVisitWidget extends StatelessWidget {
  const ListBodyWantVisitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      itemCount: mocks.length,
      itemBuilder: (context, index) {
        return SightCard(
          sight: mocks[index],
          type: CardType.wantVisitPlaning,
          childrenAction: [
            IconButtonCard(
              assetIconPath: AppAssets.calendar,
              onPressed: () {
                debugPrint('Press calendar');
              },
            ),
            IconButtonCard(
              assetIconPath: AppAssets.close,
              onPressed: () {
                debugPrint('Press clouse');
              },
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.customBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: TabBar(
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
