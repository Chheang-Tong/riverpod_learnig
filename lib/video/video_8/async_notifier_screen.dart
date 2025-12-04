import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_8/async_notifier.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingAsyncNotifierProvider);
    final greetingAsyncNotifier = ref.watch(
      greetingAsyncNotifierProvider.notifier,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => greetingAsyncNotifier.refreshGreeting(),
        heroTag: 'ref',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
