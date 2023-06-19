import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/task.dart';

class DetailNotifer extends StateNotifier<Task> {
  DetailNotifer()
      : super(Task(id: "", title: "", dateTime: null, description: ""));
  set value(Task? task) =>
      state = task ?? Task(id: "", title: "", description: "", dateTime: null);
}

final detailNotifer =
    StateNotifierProvider<DetailNotifer, Task>((ref) => DetailNotifer());
