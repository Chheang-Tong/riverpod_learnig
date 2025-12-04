class TodoModel {
  final int id;
  final String title;
  final bool complete;
  TodoModel({
    required this.id,
    required this.title,
    required this.complete
  });

  TodoModel copyWith({
    int? id,
    String? title,
    bool? complete
  }){
    return TodoModel(
        id: id??this.id,
        title: title??this.title,
        complete: complete??this.complete
    );
  }
}