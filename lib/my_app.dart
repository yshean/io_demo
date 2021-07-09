import 'package:flutter/material.dart';

import 'canvas_painting.dart';
import 'config.dart';

class MyApp extends StatelessWidget {
// const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(Config.helloMessage),
        ),
        body: CanvasPainting(),
      ),
    );
  }
}
