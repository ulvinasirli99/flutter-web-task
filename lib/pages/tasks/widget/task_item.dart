import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';

class TaskItem extends StatelessWidget {
  final bool isSelected;
  final String? title;
  final String? time;
  final int? index;
  final void Function()? onTap;
  const TaskItem({
    super.key,
    required this.isSelected,
    this.title,
    this.time,
    this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color:
              isSelected ? AppStyle.geryColor.shade400.withOpacity(0.5) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Task $index",
              style: TextStyle(
                fontSize: 16,
                color: AppStyle.blackColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            Text(
              time ?? "",
              style: TextStyle(
                fontSize: 14,
                color: AppStyle.geryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
