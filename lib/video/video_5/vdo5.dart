import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_6/vdo_6.dart';
import '/video/video_5/fake_api.dart';

final fakeApiProvider = Provider((_) => FakeApi());

final greetingFutureProvider = FutureProvider.autoDispose.family<String, int>((
  Ref ref,
  id,
) async {
  final service = ref.read(fakeApiProvider);
  return await service.fetchGreeting();
});

/// family example
final greetingFutureProviders = FutureProvider.family<String, int>((
  Ref ref,
  id,
) async {
  final service = ref.read(fakeApiProvider);
  return await service.fetchGreeting();
});

// class UserState {
//   String id='';
//   List<String> listOfUsers=[];
// }

class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingFutureProvider(34));
    ref.listen(greetingFutureProvider(34), (previous, next) {
      next.whenOrNull(
        data: (value) {
          // Navigate only once when success
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TimerScreen()),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text('Async Greeting')),
      body: Center(
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (_) => const Text("Success! Navigating..."),
          error: (err, stack) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Error: $err"),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.refresh(greetingFutureProvider(74)),
                child: Text('RETRY'),
              ),
            ],
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
