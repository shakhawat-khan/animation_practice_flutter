import 'dart:math';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TransformWidget(),
    );
  }
}

class TransformWidget extends StatefulWidget {
  const TransformWidget({super.key});

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  double test = 90;
  double _size = 100.0;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 10800),
      vsync: this,
    );

    animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn)
          ..addListener(() {
            setState(() {
              debugPrint('${animation.value}');
            });
          });

    _controller.forward();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
        body: Center(
          child: Text(
            'hello satan',
            style: TextStyle(fontSize: 30.0 * animation.value),
          ),
        ));
  }
}
