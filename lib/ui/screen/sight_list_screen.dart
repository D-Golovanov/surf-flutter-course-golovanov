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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(72.0 + 40.0),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'С',
                          style: TextStyle(
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                        TextSpan(text: 'писок\n'),
                      ],
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'и',
                          style: TextStyle(
                            color: Color(0xFFFCDD3D),
                          ),
                        ),
                        TextSpan(text: 'нтересных мест'),
                      ],
                    ),
                  ],
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
