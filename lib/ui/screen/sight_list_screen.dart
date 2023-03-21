import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class BigAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BigAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeigth = MediaQuery.of(context).padding.top;

    final heightAppBar = context.findRenderObject() as RenderBox;
    // ignore: avoid_print
    print(heightAppBar.size.height - statusBarHeigth); //132.0

    return Column(
      // height: heigth,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: statusBarHeigth + 40.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.appTitle,
            textAlign: TextAlign.left,
            style: AppTypography.text32AppTitle,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
    // AppBar(
    //   backgroundColor: AppColors.white,
    //   elevation: 0.0,
    //   toolbarHeight: 0.0,
    //   bottom: const PreferredSize(
    //     preferredSize: Size.fromHeight(72 + 40),
    //     child: SizedBox(
    //       width: double.infinity,
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 16.0),
    //         child: Text(
    //           AppStrings.appTitle,
    //           textAlign: TextAlign.left,
    //           style: AppTypography.text32AppTitle,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(132.0);
}

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: const BigAppBar(),
      body: Column(
        children: [
          // const SizedBox(height: 16.0),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: mocks.length,
              itemBuilder: (context, index) {
                return SightCard(sight: mocks[index]);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
