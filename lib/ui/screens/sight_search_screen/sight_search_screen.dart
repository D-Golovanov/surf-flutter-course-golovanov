import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/filter_controller.dart';
import 'package:places/controller/search_place_controller.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/filters_screen/filters_screen.dart';
import 'package:places/ui/screens/sight_search_screen/sight_search_widgets.dart';
import 'package:places/ui/widgets/bottom_bar.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:places/ui/widgets/icon_info.dart';
import 'package:provider/provider.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({super.key});

  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  Widget _buildBody(
    SearchPlaceController modelSearch,
    FilterController modelFilter,
  ) {
    if (modelSearch.currentScreen == StateScreen.history) {
      return HistoryListWidget(data: mocksHistory);
    }
    if (modelSearch.currentScreen == StateScreen.search) {
      modelFilter.isFiltred
          ? modelSearch.placeList = modelFilter.filtredSights
          : modelSearch.placeList = mocks;

      return SearchListWidget(data: modelSearch.placeList);
    }
    if (modelSearch.currentScreen == StateScreen.notFound) {
      return const IconInfo(
        iconPath: AppAssets.search,
        title: AppStrings.notFound,
        description: AppStrings.tryAgainSearch,
      );
    }
    if (modelSearch.currentScreen == StateScreen.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return const IconInfo(
      iconPath: AppAssets.error,
      title: AppStrings.errorTitle,
      description: AppStrings.errorDescr,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didchange');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SearchPlaceController>().loadHistory(mocksHistory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterAppBar(
        title: AppStrings.appTitleSearch,
        bottomWidgetHeigth: 60.0,
        bottomWidget: Column(
          children: [
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _SearchTextFieldWidget(),
            ),
            const SizedBox(height: 6.0),
          ],
        ),
      ),
      body: Consumer2<SearchPlaceController, FilterController>(
        builder: (context, modelSearch, modelFilter, _) =>
            _buildBody(modelSearch, modelFilter),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class _SearchTextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPlaceController>(builder: (context, model, _) {
      return TextField(
        controller: model.historyTextEditingController,
        autofocus: true,
        textInputAction: TextInputAction.search,
        onChanged: context.read<SearchPlaceController>().searchPlace,
        onEditingComplete: () {
          if (model.historyTextEditingController.text.isNotEmpty) {
            context
                .read<SearchPlaceController>()
                .addElementOnHistory(model.historyTextEditingController.text);
          }
        },
        decoration: Theme.of(context).decorationFilled.copyWith(
              hintText: AppStrings.search,
              suffixIcon: IconButton(
                onPressed: () => Navigator.push<MaterialPageRoute>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FiltersScreen(),
                  ),
                ),
                icon: SvgPicture.asset(
                  AppAssets.filter,
                  color: Theme.of(context).colorScheme.green,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  AppAssets.search,
                  color: Theme.of(context).colorScheme.secondary2Opacity,
                ),
              ),
            ),
      );
    });
  }
}
