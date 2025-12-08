import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpro/video/video_7/todo_example/todo_model.dart';

final sampleSelectProvider = StateProvider(
  (ref) => TodoModel(id: 1, title: "Create VDO10", complete: true),
);

class SampleSelectDemo extends ConsumerWidget {
  const SampleSelectDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(sampleSelectProvider.select((todo) => todo.title));
    final complete = ref.watch(
      sampleSelectProvider.select((item) => item.complete),
    );
    return Scaffold(
      appBar: AppBar(
        // title: Text('Sample Select Demo'),
      ),
      body: Column(
        children: [
          Text('With select', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('Title: $title'),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Complete: '),
              Checkbox(
                value: complete,
                onChanged: (_) {
                  final t = ref.read(sampleSelectProvider);
                  ref.read(sampleSelectProvider.notifier).state = TodoModel(
                    id: t.id,
                    title: t.title,
                    complete: !t.complete,
                  );
                },
              ),
              Checkbox(
                value: complete,
                onChanged: (_) {
                  final t = ref.read(sampleSelectProvider);
                  ref.read(sampleSelectProvider.notifier).state = TodoModel(
                    id: t.id,
                    title: t.title,
                    complete: !t.complete,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
