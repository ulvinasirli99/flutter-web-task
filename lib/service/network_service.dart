import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

import '../common/constants.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: DateTime(2022, 10, 22, 12),
        description: description,
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: DateTime(2021, 08, 16, 10),
        description: description,
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: DateTime(2023, 05, 12, 8),
        description: description,
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: DateTime(2022, 01, 01, 11),
        description: description,
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description: description,
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: DateTime(2021, 03, 10, 14),
        description: description,
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description: description,
      ),
    ];
  }
}
