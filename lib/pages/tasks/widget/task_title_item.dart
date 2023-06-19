import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';

class TaskTitleItemWidget extends StatelessWidget {
  final String title;
  final Widget? child;
  const TaskTitleItemWidget({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: size.width,
              height: 1,
              color: AppStyle.geryColor,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            SizedBox(
              height: 20,
            ),
            child ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
