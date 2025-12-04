import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingProvider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return "Hello, Riverpod!";
});

class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Greeting Screen')),
      body: Center(
        child: greetingAsync.when(
          data: (greeting) =>
              Text(greeting, style: const TextStyle(fontSize: 24)),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
