 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/video/video6/fake_streamer_service.dart';

final tickerProvider = StreamProvider((Ref ref){
  final service=ref.read(timerServiceProvider);
  return service.tickWithError();
});
class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickAsync = ref.watch(tickerProvider);
    return  Scaffold(
      appBar: AppBar(title: Text('Live Timer'),),
      body: Center(
        child: tickAsync.when(
          skipLoadingOnRefresh: false,
            data: (count)=>Center(child: Text('Seconds: $count')),
            error: (error,stackTree)=>Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("$error",style: TextStyle(fontSize: 18 ),),
                // Text("$stackTree"),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: ()=>ref.refresh(tickerProvider), child: Text('RETRY'))
              ],
            ),
            loading: ()=>Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
