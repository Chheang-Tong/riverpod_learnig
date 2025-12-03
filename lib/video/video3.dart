import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final textProvider = StateProvider((Ref ref) {
  return '';
});

class Video3 extends ConsumerStatefulWidget {
  const Video3({super.key});

  @override
  ConsumerState<Video3> createState() => _Video3State();
}

class _Video3State extends ConsumerState<Video3> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(textProvider.notifier).state = _controller.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Video 3')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(controller: _controller),
            SizedBox(height: 16),
            Text('Your Typed: $text'),
          ],
        ),
      ),
    );
  }
}
