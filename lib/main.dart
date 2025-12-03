import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'video/video1.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: MyApp())));
}
