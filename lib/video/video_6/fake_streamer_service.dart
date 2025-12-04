
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerServiceProvider = Provider((_)=>TimerService());
class TimerService{
  /// Emits an integer every second, starting at 0
  Stream<int> tick(){
    return Stream.periodic(Duration(seconds: 1),(count)=>count);
  }
  /// In Timer Service:
  Stream<int>tickWithError()async*{
    for(int i=0; i < 5; i++){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
    throw Exception('Timer stopped unexpectedly!');
  }
}