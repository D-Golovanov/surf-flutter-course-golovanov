import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/search_place_controller.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/sight_details_screen.dart';
import 'package:provider/provider.dart';

class SearchListWidget extends StatelessWidget {
  final List<Sight> data;

  const SearchListWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final sight = data[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 11.0),
          onTap: () {
            Navigator.push<MaterialPageRoute>(
              context,
              MaterialPageRoute(
                builder: (context) => SightDetailsScreen(sight: sight),
              ),
            );
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sight.name,
                style: Theme.of(context).textTheme.text16Regular.copyWith(
                      color: Theme.of(context).colorScheme.textColor,
                    ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          subtitle: Text(
            sight.type,
            style: Theme.of(context).textTheme.small14Regular.copyWith(
                  color: Theme.of(context).colorScheme.secondary2,
                ),
          ),
          leading: Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(sight.url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(
        indent: 72,
        height: 0,
      ),
    );
  }
}

class HistoryListWidget extends StatelessWidget {
  final List<String> data;

  const HistoryListWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: data.length + 1,
            itemBuilder: (context, index) {
              return index != data.length
                  ? ListTile(
                      contentPadding: const EdgeInsets.only(left: 0.0),
                      onTap: () => context
                          .read<SearchPlaceController>()
                          .changeTextField(data[index]),
                      title: Text(
                        data[index],
                        style: Theme.of(context)
                            .textTheme
                            .text16Regular
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary2,
                            ),
                      ),
                      trailing: IconButton(
                        onPressed: () => context
                            .read<SearchPlaceController>()
                            .removeElementOnHistory(data[index]),
                        icon: SvgPicture.asset(
                          AppAssets.delete,
                          color: Theme.of(context).colorScheme.secondary2,
                        ),
                      ),
                    )
                  : ListTile(
                      contentPadding: const EdgeInsets.only(left: 0.0),
                      onTap: context.read<SearchPlaceController>().clearHistory,
                      title: Text(
                        AppStrings.cleanHistory,
                        style:
                            Theme.of(context).textTheme.text16Medium.copyWith(
                                  color: Theme.of(context).colorScheme.green,
                                ),
                      ),
                    );
            },
            separatorBuilder: (_, __) => const Divider(
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
