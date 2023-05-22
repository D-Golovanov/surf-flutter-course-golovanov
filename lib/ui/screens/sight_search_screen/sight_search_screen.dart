import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/search_place_controller.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBody(SearchPlaceController state) {
    if (state.currentScreen == StateScreen.history) {
      return HistoryListWidget(data: mocksHistory);
    }
    if (state.currentScreen == StateScreen.search) {
      return SearchListWidget(data: mocks);
    }
    if (state.currentScreen == StateScreen.notFound) {
      return const IconInfo(
        iconPath: AppAssets.search,
        title: AppStrings.notFound,
        description: AppStrings.tryAgainSearch,
      );
    }
    if (state.currentScreen == StateScreen.loading) {
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
      Provider.of<SearchPlaceController>(context, listen: false)
          .loadHistory(mocksHistory);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      body: Consumer<SearchPlaceController>(
        builder: (context, state, child) => _buildBody(state),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class _SearchTextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPlaceController>(
      builder: (context, value, _) => TextField(
        controller: value.historyTextEditingController,
        autofocus: true,
        textInputAction: TextInputAction.search,
        onChanged: context.read<SearchPlaceController>().searchPlace,
        onEditingComplete: () {
          if (value.historyTextEditingController.text.isNotEmpty) {
            context
                .read<SearchPlaceController>()
                .addElementOnHistory(value.historyTextEditingController.text);
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
      ),
    );
  }
}

/*
class _SearchTextFieldWidget extends StatefulWidget {
  final TextEditingController _searchController;

  const _SearchTextFieldWidget({
    required TextEditingController searchController,
  }) : _searchController = searchController;

  @override
  State<_SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<_SearchTextFieldWidget> {
  void changeTextField(String value) {
    widget._searchController.text = value;
    widget._searchController.selection =
        TextSelection.collapsed(offset: value.length);
  }

  void listenerController() {
    context.watch<SearchPlaceController>().textSearch;
  }

  @override
  void initState() {
    widget._searchController.addListener(listenerController);
    super.initState();
  }

  @override
  void dispose() {
    widget._searchController.removeListener(listenerController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._searchController,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onChanged: context.read<SearchPlaceController>().searchPlace,
      onEditingComplete: () {
        if (widget._searchController.text.isNotEmpty) {
          context
              .read<SearchPlaceController>()
              .addElementOnHistory(widget._searchController.text);
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
  }
}
*/