import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0; // Initial value of the counter
});

class StateProviderTutorial extends ConsumerWidget {
  const StateProviderTutorial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Provider Tutorial')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Increment the counter when the button is pressed
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Counter Value: ${ref.watch(counterProvider)}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
