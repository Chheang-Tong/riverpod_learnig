import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '/video/video_7/todo_example/todo_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
      (ref) => TodoListNotifier([]),
    );

final todoListsProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
      (ref) => TodoListNotifier(
        List.generate(
          10,
          (i) => TodoModel(id: i, title: 'Todo Item $i', complete: i % 3 == 0),
        ),
      ),
    );

final todoListLengthProvider = Provider<int>((ref) {
  return ref.watch(todoListsProvider).length;
});

class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  TodoListNotifier(super.state);

  void add(String title) {
    final newToDO = TodoModel(
      id: state.isEmpty ? 0 : state.last.id + 1,
      title: title,
      complete: false,
    );

    state = [...state, newToDO];
  }

  void remove(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  void toggle(int id) {
    final todos = [...state];
    final index = todos.indexWhere((t) => t.id == id);
    if (index == -1) return;
    final todo = todos[index];
    todos[index] = todo.copyWith(complete: !todo.complete);

    state = todos;
  }
}
