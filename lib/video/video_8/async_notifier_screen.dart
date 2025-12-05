import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_8/async_notifier.dart';
import 'package:riverpro/video/video_9/computed_screen.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const id = 34;
    final greetingAsync = ref.watch(greetingAsyncNotifierProvider(id));
    final greetingAsyncNotifier = ref.watch(
      greetingAsyncNotifierProvider(id).notifier,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Async Notifier')),
      body: Center(
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (g) => Text(g, style: TextStyle(fontSize: 24)),
          error: (error, stackTree) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Error: $error"),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => greetingAsyncNotifier.refreshGreeting(),
                child: const Text('RETRY'),
              ),
            ],
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: .max,
        children: [
          FloatingActionButton(
            onPressed: () => greetingAsyncNotifier.refreshGreeting(),
            heroTag: 'ref',
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ComputedScreen()));
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
