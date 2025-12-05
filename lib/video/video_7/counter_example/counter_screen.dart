import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/video/video_7/todo_example/todo_screen.dart';
import '/video/video_7/counter_example/counter_provider_controller.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final ctrl = ref.read(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Counter: $counter"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const TodoScreen()));
              },
              child: const Text('Next Screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ctrl.decrement(),
            heroTag: 'dec_fab', // 👈 unique
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () => ctrl.increment(),
            heroTag: 'inc_fab', // 👈 unique
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () => ctrl.reset(),
            heroTag: 'reset_fab', // 👈 unique
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
