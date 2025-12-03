import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: MyApp())));
}

final staticStringProvider = Provider<String>((ref) {
  return "Hello Guy!";
});

final intProvider = Provider((ref) {
  return 10;
});
final doubleProvider = Provider((ref) {
  return 42.24;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(staticStringProvider);
    final intValue = ref.watch(intProvider);
    final doubleValue = ref.watch(doubleProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(result + intValue.toString() + doubleValue.toString()),
      ),
      body: Container(),
    );
  }
}
