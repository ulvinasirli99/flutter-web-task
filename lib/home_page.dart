import 'package:flutter/material.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/common/router.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
            child: AppNavigationBar(),
          ),
          Expanded(
            child: currentPage(router.location),
          ),
        ],
      ),
    );
  }
}
