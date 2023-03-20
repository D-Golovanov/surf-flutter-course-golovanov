import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;
  const SightDetails({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   color: AppColors.darkBlue,
                //   height: 360.0,
                // ),
                Image.network(
                  sight.url,
                  height: 360.0,
                  fit: BoxFit.cover,
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
                        color: AppColors.darkBlue,
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
                    style: AppTypography.title24Detail,
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text(
                        sight.type,
                        style: AppTypography.text14Category
                            .copyWith(color: AppColors.darkBlue),
                      ),
                      const SizedBox(width: 16.0),
                      const Text(
                        'закрыто до 10:00',
                        style: AppTypography.text14Description,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    sight.details,
                    style: AppTypography.text14Description
                        .copyWith(color: AppColors.darkTextBlue),
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    height: 48.0,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.track),
                        const SizedBox(width: 8.0),
                        Text(
                          AppStrings.buttonCreateTrack.toUpperCase(),
                          style: AppTypography.button14,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Divider(
                    height: 0.8,
                    color: AppColors.lightTextBlue.withOpacity(0.56),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.calendar,
                                color:
                                    AppColors.lightTextBlue.withOpacity(0.56),
                                height: 24.0,
                                width: 24.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                AppStrings.plan,
                                style: AppTypography.text14Description.copyWith(
                                  color:
                                      AppColors.lightTextBlue.withOpacity(0.56),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.favorite,
                                color: AppColors.darkTextBlue,
                                height: 24.0,
                                width: 24.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                AppStrings.addFavorite,
                                style: AppTypography.text14Description.copyWith(
                                  color: AppColors.darkTextBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
