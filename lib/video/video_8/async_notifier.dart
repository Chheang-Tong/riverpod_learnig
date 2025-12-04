import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_5/vdo5.dart';

final greetingAsyncNotifierProvider =
    AsyncNotifierProvider<GreetingAsyncNotifier, String>(
      () => GreetingAsyncNotifier(),
    );

class GreetingAsyncNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    return await ref.read(fakeApiProvider).fetchGreeting();
  }

  Future<void> refreshGreeting() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await ref.read(fakeApiProvider).fetchGreeting(),
    );
    // AsyncValue.guard(()async=> await ref.read(fakeApiProvider).fetchGreeting());
    // try {
    //   state = AsyncValue.loading();
    //   final value = await ref.read(fakeApiProvider).fetchGreeting();
    //   state = AsyncData(value);
    // } catch (e) {
    //   state = AsyncValue.error(e, StackTrace.current);
    // }
  }
}
