import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/domain/sight.dart';

class SightDetailsScreen extends StatelessWidget {
  final Sight sight;
  const SightDetailsScreen({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  sight.url,
                  height: 360.0,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return SizedBox(
                      height: 360,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AppAssets.photo,
                              width: 64.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .customBackground,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: LinearProgressIndicator(
                              color: Theme.of(context).colorScheme.green,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .customBackground,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12.0, left: 16.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 32.0,
                    width: 32.0,
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.arrowBack,
                        color: AppColors.ligthMain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24.0),
                  Text(
                    sight.name,
                    style: Theme.of(context).textTheme.title24Bold.copyWith(
                          color: Theme.of(context).colorScheme.textColor,
                        ),
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text(
                        sight.type,
                        style: Theme.of(context).textTheme.small14Bold.copyWith(
                              color: Theme.of(context).colorScheme.secondary2,
                            ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        'закрыто до 10:00',
                        style:
                            Theme.of(context).textTheme.small14Regular.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary2Opacity,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    sight.details,
                    style: Theme.of(context).textTheme.small14Regular.copyWith(
                          color: Theme.of(context).colorScheme.textColor,
                        ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      debugPrint('Press build truk');
                    },
                    icon: SvgPicture.asset(AppAssets.track),
                    label: Text(AppStrings.buttonCreateTrack.toUpperCase()),
                  ),
                  const SizedBox(height: 24.0),
                  const Divider(
                    height: 0.8,
                    color: AppColors.secondary2Opacity,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {
                            debugPrint('Press build calendar');
                          },
                          icon: SvgPicture.asset(
                            AppAssets.calendar,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: const Text(AppStrings.plan),
                        ),
                      ),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {
                            debugPrint('Press build add favorite');
                          },
                          icon: SvgPicture.asset(
                            AppAssets.favorite,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: const Text(AppStrings.addFavorite),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
