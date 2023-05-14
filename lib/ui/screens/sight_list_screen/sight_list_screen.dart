import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/ui/screens/sight_list_screen/sight_list_widgets.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BigAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NewPlaceButtonWidget(),
      body: Column(
        children: const [
          SearchWidget(),
          ListBodyWidget(),
        ],
      ),
    );
  }
}
