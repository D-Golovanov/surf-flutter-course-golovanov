import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/themes.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

enum CardType { normal, wantVisit, wantVisitPlaning, visited }

class SightCard extends StatelessWidget {
  final CardType type;
  final Sight sight;

  const SightCard({super.key, required this.sight, required this.type});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              children: [
                _ImageCardWidget(
                  sight: sight,
                  type: type,
                ),
                _TextCardWidget(
                  sight: sight,
                  type: type,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                Navigator.push<MaterialPageRoute>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SightDetailsScreen(sight: sight),
                  ),
                );
              },
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sight.type,
                  style: Theme.of(context)
                      .textTheme
                      .small14Bold
                      .copyWith(color: AppColors.white),
                ),
                if (type == CardType.normal)
                  IconButtonCard(
                    assetIconPath: AppAssets.favorite,
                    onPressed: () {
                      debugPrint('Press favorite');
                    },
                  ),
                if (type == CardType.wantVisit ||
                    type == CardType.wantVisitPlaning)
                  Row(
                    children: [
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
                  ),
                if (type == CardType.visited)
                  Row(
                    children: [
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
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TextCardWidget extends StatelessWidget {
  final CardType type;
  final Sight sight;

  const _TextCardWidget({required this.sight, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.customBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            sight.name,
            style: Theme.of(context)
                .textTheme
                .text16Medium
                .copyWith(color: Theme.of(context).colorScheme.textColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2.0),
          if (type == CardType.wantVisitPlaning)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Запланировано на 12 окт. 2020',
                style: Theme.of(context)
                    .textTheme
                    .small14Regular
                    .copyWith(color: Theme.of(context).colorScheme.green),
              ),
            ),
          if (type == CardType.visited)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Цель достигнута 12 окт. 2020',
                style: Theme.of(context)
                    .textTheme
                    .small14Regular
                    .copyWith(color: Theme.of(context).colorScheme.secondary2),
              ),
            ),
          Text(
            'закрыто до 10:00',
            style: Theme.of(context)
                .textTheme
                .small14Regular
                .copyWith(color: Theme.of(context).colorScheme.secondary2),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class _ImageCardWidget extends StatelessWidget {
  final CardType type;
  final Sight sight;

  const _ImageCardWidget({required this.sight, required this.type});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Image.network(
            sight.url,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      AppAssets.photo,
                      width: 64.0,
                      color: Theme.of(context).colorScheme.customBackground,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.green,
                      backgroundColor:
                          Theme.of(context).colorScheme.customBackground,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                ],
              );
            },
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                gradient: LinearGradient(
                  colors: [
                    AppColors.ligthMain,
                    AppColors.secondary.withOpacity(0.08),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         sight.type,
          //         style: Theme.of(context)
          //             .textTheme
          //             .small14Bold
          //             .copyWith(color: AppColors.white),
          //       ),
          //       if (type == CardType.normal)
          //         IconButtonCard(
          //           assetIconPath: AppAssets.favorite,
          //           onPressed: () {
          //             debugPrint('Press favorite');
          //           },
          //         ),
          //       if (type == CardType.wantVisit ||
          //           type == CardType.wantVisitPlaning)
          //         Row(
          //           children: [
          //             IconButtonCard(
          //               assetIconPath: AppAssets.calendar,
          //               onPressed: () {
          //                 debugPrint('Press calendar');
          //               },
          //             ),
          //             IconButtonCard(
          //               assetIconPath: AppAssets.close,
          //               onPressed: () {
          //                 debugPrint('Press clouse');
          //               },
          //             ),
          //           ],
          //         ),
          //       if (type == CardType.visited)
          //         Row(
          //           children: [
          //             IconButtonCard(
          //               assetIconPath: AppAssets.share,
          //               onPressed: () {
          //                 debugPrint('Press share');
          //               },
          //             ),
          //             IconButtonCard(
          //               assetIconPath: AppAssets.close,
          //               onPressed: () {
          //                 debugPrint('Press clouse');
          //               },
          //             ),
          //           ],
          //         ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class IconButtonCard extends StatelessWidget {
  final String assetIconPath;
  final VoidCallback onPressed;

  const IconButtonCard({
    super.key,
    required this.assetIconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: SvgPicture.asset(assetIconPath),
    );
  }
}
