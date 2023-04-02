import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';

enum CardType { normal, wantVisit, wantVisitPlaning, visited }

class SightCard extends StatelessWidget {
  final CardType type;
  final Sight sight;

  const SightCard({super.key, required this.sight, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<MaterialPageRoute>(
          context,
          MaterialPageRoute(
            builder: (context) => SightDetails(sight: sight),
          ),
        );
      },
      child: ClipRRect(
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
      color: AppColors.backgroung,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            sight.name,
            style: AppTypography.text16CardTitle,
            maxLines: 3,
          ),
          const SizedBox(height: 2.0),
          if (type == CardType.wantVisitPlaning)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Запланировано на 12 окт. 2020',
                style: AppTypography.text14Description
                    .copyWith(color: AppColors.green),
              ),
            ),
          if (type == CardType.visited)
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Цель достигнута 12 окт. 2020',
                style: AppTypography.text14Description,
              ),
            ),
          const Text(
            'закрыто до 10:00',
            style: AppTypography.text14Description,
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
                      color: AppColors.backgroung,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      color: AppColors.green,
                      backgroundColor: AppColors.backgroung,
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
                    AppColors.darkBlue,
                    AppColors.darkTextBlue.withOpacity(0.08),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sight.type,
                  style: AppTypography.text14Category,
                ),
                if (type == CardType.normal)
                  IconButton(
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAssets.favorite,
                    ),
                  ),
                if (type == CardType.wantVisit ||
                    type == CardType.wantVisitPlaning)
                  Row(
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppAssets.calendar,
                        ),
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppAssets.close,
                        ),
                      ),
                    ],
                  ),
                if (type == CardType.visited)
                  Row(
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppAssets.share,
                        ),
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppAssets.close,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
