import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 0.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(72.0 + 40.0),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Список\nинтересных мест',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF252849),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Center(child: Text('Test')),
          ),
          TextField(),
        ],
      ),
    );
  }
}
