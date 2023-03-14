import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySecondWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  MyFirstWidget({super.key});
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(count);
    count++;
    return const Center(
      child: Text('Hello!'),
    );
  }
}

class MySecondWidget extends StatefulWidget {
  const MySecondWidget({super.key});

  @override
  State<MySecondWidget> createState() => _MySecondWidgetState();
}

class _MySecondWidgetState extends State<MySecondWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(count);
    count++;

    return const Center(
      child: Text('Hello! StateFull'),
    );
  }
}
