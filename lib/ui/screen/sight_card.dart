import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  const SightCard({super.key, required this.sight});

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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 96.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(sight.url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 96.0,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sight.type,
                        style: AppTypography.text14Category,
                      ),
                      SvgPicture.asset(
                        AppAssets.favorite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: AppColors.backgroung,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sight.name,
                    style: AppTypography.text16CardTitle,
                  ),
                  const SizedBox(height: 2.0),
                  const Text(
                    'зактыть до 10:00',
                    style: AppTypography.text14Description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
