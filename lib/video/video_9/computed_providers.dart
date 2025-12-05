import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '/video/video_7/todo_example/todo_model.dart';
import '/video/video_7/todo_example/todo_provider_controller.dart';

final numberProvider = StateProvider<List<int>>((_) => [1, 2, 3, 4, 5]);

final sumProvider = Provider<int>((Ref ref) {
  final list = ref.watch(numberProvider);
  return list.fold(0, (total, n) => total + n);
});

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
      (ref) => TodoListNotifier([]),
    );

final filterTextProvider = StateProvider<String>((_) => '');

final filteredTodoProvider = Provider<List<TodoModel>>((ref) {
  final filter = ref.watch(filterTextProvider);
  final todos = ref.watch(todoListProvider);
  if (filter.isEmpty) return todos;


  return todos
      .where((todo) => todo.title.toLowerCase().contains(filter))
      .toList();
});
