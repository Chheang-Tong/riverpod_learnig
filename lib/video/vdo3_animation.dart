import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = Provider((_) => const Duration(seconds: 2));

class Vdo3Animation extends ConsumerStatefulWidget {
  const Vdo3Animation({super.key});

  @override
  ConsumerState<Vdo3Animation> createState() => _Vdo3AnimationState();
}

class _Vdo3AnimationState extends ConsumerState<Vdo3Animation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    final duration = ref.read(durationProvider);
    _controller = AnimationController(vsync: this, duration: duration)
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vdo 3 Animation')),
      body: Center(
        // child: AnimatedBuilder(
        //   animation: _controller,
        //   builder: (context, child) {
        //     return Opacity(
        //       opacity: _controller.value,
        //       child: child,
        //     );
        //   },
        //   child: const Icon(
        //     Icons.favorite,
        //     color: Colors.red,
        //     size: 100,
        //   ),
        // ),
        child: ScaleTransition(
          scale: _controller.drive(Tween(begin: 0.5, end: 1.5)),
          child: const Icon(Icons.favorite, color: Colors.red, size: 100),
        ),
      ),
    );
  }
}
