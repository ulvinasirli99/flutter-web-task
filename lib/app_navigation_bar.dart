import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/common/box_style.dart';
import 'package:task_list_app/common/router.dart';
import 'package:task_list_app/generated/l10n.dart';
import 'package:task_list_app/riverpod/detail_riverpod.dart';
import 'package:task_list_app/riverpod/langauge_riverpod.dart';
import 'common/constants.dart';

// ignore: must_be_immutable
class AppNavigationBar extends ConsumerWidget {
  AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length + 1,
        itemBuilder: (context, index) {
          if (navigationBarItems.length == index) {
            Locale locale = ref.watch(langNotifer);
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: DropdownButton<Locale>(
                value: locale,
                underline: SizedBox(),
                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.white, fontSize: 16),
                items: [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text(S.of(context).en_lang),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text(S.of(context).ar_lang),
                  ),
                ],
                onChanged: (Locale? locale) {
                ref.read(detailNotifer.notifier).value = null;
                  ref.read(langNotifer.notifier).value = locale;
                },
              ),
            );
          }
          return _NavigationBarListItem(
            item: navigationBarItems[index],
            checkColor: index == calcluateIndex(router.location),
            onTap: () {
              if (index != 0) {
                ref.read(detailNotifer.notifier).value = null;
              }
              onTap(context, index);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

void onTap(BuildContext context, int value) {
  switch (value) {
    case 0:
      return context.go(RouteRoads.tasks);
    case 1:
      return context.go(RouteRoads.projects);
    case 2:
      return context.go(RouteRoads.teams);
    default:
      return context.go(RouteRoads.tasks);
  }
}

class _NavigationBarListItem extends ConsumerWidget {
  final bool checkColor;
  final void Function() onTap;
  _NavigationBarListItem({
    Key? key,
    required this.item,
    required this.checkColor,
    required this.onTap,
  }) : super(key: key);
  final NavigationBarItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxStyles.navBarDecoration(context, checkColor),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          item.name,
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

final navigationBarItems = [
  NavigationBarItem(name: S.current.title_tasks, url: RouteRoads.tasks),
  NavigationBarItem(name: S.current.title_projects, url: RouteRoads.projects),
  NavigationBarItem(name: S.current.title_teams, url: RouteRoads.teams),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
