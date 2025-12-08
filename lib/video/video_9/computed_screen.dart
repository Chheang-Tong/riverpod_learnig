import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_10/select_list_screen.dart';
import 'package:riverpro/video/video_10/select_sample_demo.dart';
import 'package:riverpro/video/video_9/computed_providers.dart';

class ComputedScreen extends ConsumerWidget {
  const ComputedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sum = ref.watch(sumProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Computed Providers')),
      body: Column(
        children: [
          Text('Total: $sum', style: TextStyle(fontSize: 24)),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => TodoFilterScreen()));
            },
            child: Text('Todo Filter Example'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final list = ref.read(numberProvider.notifier).state;
          ref.read(numberProvider.notifier).state = [...list, list.length + 1];
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoFilterScreen extends ConsumerWidget {
  TodoFilterScreen({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodoProvider);
    final notifier = ref.watch(todoListProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Filter Example')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (t) => ref.read(filterTextProvider.notifier).state = t,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, i) {
                final todo = todos[i];
                return ListTile(
                  leading: Checkbox(
                    value: todo.complete,
                    onChanged: (val) {
                      notifier.toggle(todo.id);
                    },
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.complete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      notifier.remove(todo.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => SampleSelectDemo()));
            },
            child: Text('Demo'),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => SelectListScreen()));
            },
            child: Text('Screen'),
          ),
          FloatingActionButton(
            onPressed: () {
              final text = _controller.text.trim();
              if (text.isNotEmpty) {
                notifier.add(text);
                _controller.clear();
              }
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
