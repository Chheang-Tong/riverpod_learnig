// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpro/video/video_7/todo_example/todo_model.dart';
import 'package:riverpro/video/video_7/todo_example/todo_provider_controller.dart';

class SelectListScreen extends ConsumerWidget {
  const SelectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(todoListProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Select List Screen')),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Without select(bad)'),
                ),
                Expanded(child: TodoListWithOutSelect()),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('With select(good)'),
                ),
                Expanded(child: TodoListWithSelect()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // notifier.addTodo('New Todo ${DateTime.now()}');
        },
        label: Text('Add ToDo'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class TodoListWithOutSelect extends ConsumerWidget {
  const TodoListWithOutSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListsProvider);
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (_, i) {
        final todo = todoList[i];
        return ListTile(
          leading: Checkbox(value: todo.complete, onChanged: (_) {}),
          title: Text('Todo Item ${todo.id}'),
        );
      },
    );
  }
}

class TodoListWithSelect extends ConsumerWidget {
  const TodoListWithSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(todoListLengthProvider);

    return ListView.builder(
      itemCount: length,
      itemBuilder: (_, i) {
        final todo = ref.read(todoListsProvider)[i];
        final completed = ref.watch(
          todoListProvider.select((ls) {
            final t = ls.firstWhere(
              (t) => t.id == todo.id,
              orElse: () => TodoModel(
                id: todo.id,
                title: todo.title,
                complete: todo.complete,
              ),
            );
            return t.complete;
          }),
        );

        return ListTile(
          leading: Checkbox(value: completed, onChanged: (_) {}),
          title: Text(todo.title),
        );
      },
    );
  }
}
