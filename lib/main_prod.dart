import 'package:flutter/material.dart';

import 'config.dart';
import 'my_app.dart';

void main() {
  Config.appFlavor = Flavor.prod;
  runApp(MyApp());
}
