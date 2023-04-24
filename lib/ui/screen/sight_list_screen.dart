import 'package:flutter/material.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  bool theme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const _BigAppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push<MaterialPageRoute>(
                context,
                MaterialPageRoute(
                  builder: (context) => const FiltersScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Filter'),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: mocks.length,
              itemBuilder: (context, index) {
                return SightCard(
                  sight: mocks[index],
                  type: CardType.normal,
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}

class _BigAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BigAppBar();

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
