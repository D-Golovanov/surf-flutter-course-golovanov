import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/new_place_controller.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/category_place_screen/category_place_screen.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:places/ui/widgets/label_text_upper_case_widget.dart';
import 'package:provider/provider.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({super.key});

  @override
  State<AddSightScreen> createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final FocusNode _categoryFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _latitudeFocus = FocusNode();
  final FocusNode _longitudeFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  @override
  void dispose() {
    _categoryFocus.dispose();
    _nameFocus.dispose();
    _latitudeFocus.dispose();
    _longitudeFocus.dispose();
    _descriptionFocus.dispose();

    _categoryController.dispose();
    _nameController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _categoryController.text =
        Provider.of<NewPlaceController>(context).category;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NewPlaceController>(context);

    return Scaffold(
      appBar: CenterAppBar(
        title: AppStrings.appTitleNewPlace,
        leadingWidget: TextButton(
          style: Theme.of(context).greyTextButtonTheme,
          onPressed: () {
            state.category = '';
            Navigator.pop(context);
          },
          child: const Text('Отмена'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                const Placeholder(fallbackHeight: 72.0),
                const SizedBox(height: 24.0),
                const LabelTextUpperCaseWidget(text: AppStrings.category),
                const SizedBox(height: 12.0),

                //! Text field category
                TextFormField(
                  controller: _categoryController,
                  readOnly: true,
                  onTap: () => Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPlaceScreen(),
                    ),
                  ),
                  decoration: Theme.of(context).decoration.copyWith(
                        hintText: AppStrings.categoryNotChoice,
                        suffixIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.0,
                          color: Theme.of(context).colorScheme.textColor,
                        ),
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                const LabelTextUpperCaseWidget(text: AppStrings.name),
                const SizedBox(height: 12.0),

                //! Text field name place
                TextFormField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: AppStrings.nameHint,
                    suffixIcon: _nameController.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _nameController.clear();
                              setState(() {});
                            },
                            icon: SvgPicture.asset(
                              AppAssets.clear,
                              color: Theme.of(context).colorScheme.textColor,
                            ),
                          ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }

                    return null;
                  },
                  onChanged: (value) => setState(() {}),
                  onEditingComplete: () => _latitudeFocus.requestFocus(),
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelTextUpperCaseWidget(
                              text: AppStrings.latitude.toUpperCase()),
                          const SizedBox(height: 12.0),

                          //! Text field latitude place
                          TextFormField(
                            controller: _latitudeController,
                            focusNode: _latitudeFocus,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: AppStrings.latitudeHint,
                              suffixIcon: _latitudeController.text.isEmpty
                                  ? null
                                  : IconButton(
                                      onPressed: () {
                                        _latitudeController.clear();
                                        setState(() {});
                                      },
                                      icon: SvgPicture.asset(
                                        AppAssets.clear,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .textColor,
                                      ),
                                    ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              } else if (double.parse(value) < -90 ||
                                  double.parse(value) > 90) {
                                return '';
                              }

                              return null;
                            },
                            onChanged: (value) => setState(() {}),
                            onEditingComplete: () =>
                                _longitudeFocus.requestFocus(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelTextUpperCaseWidget(
                              text: AppStrings.longitude.toUpperCase()),
                          const SizedBox(height: 12.0),

                          //! Text field longitude place
                          TextFormField(
                            controller: _longitudeController,
                            focusNode: _longitudeFocus,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: AppStrings.longitudeHint,
                              suffixIcon: _longitudeController.text.isEmpty
                                  ? null
                                  : IconButton(
                                      onPressed: () {
                                        _longitudeController.clear();
                                        setState(() {});
                                      },
                                      icon: SvgPicture.asset(
                                        AppAssets.clear,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .textColor,
                                      ),
                                    ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              } else if (double.parse(value) < -180 ||
                                  double.parse(value) > 180) {
                                return '';
                              }

                              return null;
                            },
                            onChanged: (value) => setState(() {}),
                            onEditingComplete: () =>
                                _descriptionFocus.requestFocus(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Press location on map');
                    },
                    child: Text(
                      'Указать на карте',
                      style: Theme.of(context)
                          .textTheme
                          .text16Medium
                          .copyWith(color: Theme.of(context).colorScheme.green),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                LabelTextUpperCaseWidget(text: 'Описание'.toUpperCase()),
                const SizedBox(height: 12.0),

                //! Text field description place
                TextFormField(
                  controller: _descriptionController,
                  focusNode: _descriptionFocus,
                  maxLines: 3,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }

                    return null;
                  },
                  onEditingComplete: () => _descriptionFocus.unfocus(),
                ),
                const SizedBox(height: 28.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      mocks.add(Sight(
                        name: _nameController.text,
                        lat: _latitudeController.text,
                        lon: _longitudeController.text,
                        url:
                            'https://laplaya-rus.ru/wp-content/uploads/1/a/d/1ad1b1389a45830819cc47c83af32480.png',
                        details: _descriptionController.text,
                        type: state.category,
                      ));
                      state.category = '';
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Создать'.toUpperCase(),
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
