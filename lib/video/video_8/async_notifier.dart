import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_5/vdo5.dart';

final greetingAsyncNotifierProvider =
    AsyncNotifierProvider.autoDispose.family<GreetingAsyncNotifier, String, int>(
     GreetingAsyncNotifier.new
    );

class GreetingAsyncNotifier extends AsyncNotifier<String> {
   GreetingAsyncNotifier(this.id);
   final int id;
  @override
  Future<String> build() async {
    return await ref.read(fakeApiProvider).fetchGreeting();
  }

  Future<void> refreshGreeting() async {
    state =const AsyncValue.loading();
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
