import 'package:flutter/material.dart';

import 'loadingscreen.dart';

void main() => runApp(
      AbdulApp(),
    );

class AbdulApp extends StatelessWidget {
  const AbdulApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}
