import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/themes.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/sight_details_screen.dart';

enum CardType { normal, wantVisit, wantVisitPlaning, visited }

class SightCard extends StatelessWidget {
  final CardType type;
  final Sight sight;
  final List<Widget> childrenAction;

  const SightCard({
    super.key,
    required this.sight,
    required this.type,
    required this.childrenAction,
  });

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
                Row(
                  children: [
                    ...List.generate(
                      childrenAction.length,
                      (index) => childrenAction[index],
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
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: theme.colorScheme.customBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            sight.name,
            style: theme.textTheme.text16Medium
                .copyWith(color: theme.colorScheme.textColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2.0),
          if (type == CardType.wantVisitPlaning)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Запланировано на 12 окт. 2020',
                style: theme.textTheme.small14Regular
                    .copyWith(color: theme.colorScheme.green),
              ),
            ),
          if (type == CardType.visited)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Цель достигнута 12 окт. 2020',
                style: theme.textTheme.small14Regular
                    .copyWith(color: theme.colorScheme.secondary2),
              ),
            ),
          Text(
            'закрыто до 10:00',
            style: theme.textTheme.small14Regular
                .copyWith(color: theme.colorScheme.secondary2),
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
    final theme = Theme.of(context);

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
                      color: theme.colorScheme.customBackground,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      color: theme.colorScheme.green,
                      backgroundColor: theme.colorScheme.customBackground,
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
        ],
      ),
    );
  }
}
