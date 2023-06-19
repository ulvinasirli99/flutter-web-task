import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/constants.dart';
import 'package:task_list_app/common/date_format.dart';
import 'package:task_list_app/riverpod/detail_riverpod.dart';
import '../../../model/task.dart';
import '../../../service/network_service.dart';
import '../widget/task_item.dart';
import '../widget/task_title_item.dart';
import 'dart:html' as html;

// ignore: must_be_immutable
class TasksPage extends ConsumerWidget {
  int pIndex = -1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    NetworkService networkService = ref.watch(networkServiceProvider);
    Task detailTask = ref.watch(detailNotifer);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TaskTitleItemWidget(
                title: "Tasks",
                child: Expanded(
                  child: FutureBuilder<List<Task>>(
                    future: networkService.getTasks(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TaskItem(
                              onTap: () {
                                pIndex = index;
                                ref.read(detailNotifer.notifier).value =
                                    snapshot.data![index];
                                html.window.history.pushState(
                                    {}, '', '${RouteRoads.tasks}/${index + 1}');
                              },
                              isSelected: pIndex == index,
                              index: index + 1,
                              title: snapshot.data?[index].title,
                              time: formatDate(
                                snapshot.data?[index].dateTime,
                              ),
                            );
                          },
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: 1.5,
              height: size.height,
              color: Colors.grey.withOpacity(0.5),
            ),
            Expanded(
              child: TaskTitleItemWidget(
                title: "Task ${detailTask.id}",
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          formatDate(detailTask.dateTime) ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          detailTask.description ?? "",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
