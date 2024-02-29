import 'package:flutter/material.dart';

import './injection_container.dart' as di;
import 'application.dart';

void main() {
  di.intDependencies();
  runApp(const Application());
}
