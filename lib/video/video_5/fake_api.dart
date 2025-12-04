import 'dart:math';

class FakeApi{
  Future<String> fetchGreeting()async{
    await Future.delayed(Duration(seconds: 2));
    if(Random().nextDouble() < 0.50) {
      throw Exception('Failed to fetch greeting');
    }
    print("Random value: ${Random().nextDouble()}");

    return 'Hell0  Guy';
  }
}