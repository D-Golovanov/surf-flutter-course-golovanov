import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/filters_screen/filters_screen.dart';
import 'package:places/ui/widgets/icon_button_card.dart';
import 'package:places/ui/widgets/sight_card.dart';

class BigAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BigAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeigth = MediaQuery.of(context).padding.top;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: statusBarHeigth + 40.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.appTitle,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .largeTitle32Bold
                .copyWith(color: Theme.of(context).colorScheme.textAppBarColor),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(132.0);
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.0,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              Navigator.push<MaterialPageRoute>(
                context,
                MaterialPageRoute(
                  builder: (context) => const FiltersScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              AppAssets.filter,
              color: Theme.of(context).colorScheme.green,
            ),
          ),
        ),
      ),
    );
  }
}

class ListBodyWidget extends StatelessWidget {
  const ListBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: mocks.length,
        itemBuilder: (context, index) {
          return SightCard(
            sight: mocks[index],
            type: CardType.normal,
            childrenAction: [
              IconButtonCard(
                assetIconPath: AppAssets.favorite,
                onPressed: () {
                  debugPrint('Press favorite');
                },
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      ),
    );
  }
}
