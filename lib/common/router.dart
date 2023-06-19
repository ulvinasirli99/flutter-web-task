import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/constants.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteRoads.tasks,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteRoads.tasks,
          builder: (BuildContext context, GoRouterState state) {
            return TasksPage();
          },
        ),
        GoRoute(
          path: RouteRoads.projects,
          builder: (BuildContext context, GoRouterState state) {
            return ProjectsPage();
          },
        ),
        GoRoute(
          path: RouteRoads.teams,
          builder: (BuildContext context, GoRouterState state) {
            return TeamsPage();
          },
        ),
      ],
    ),
  ],
);

int calcluateIndex(String route) {
  switch (route) {
    case RouteRoads.tasks:
      return 0;
    case RouteRoads.projects:
      return 1;
    case RouteRoads.teams:
      return 2;
    default:
      return 0;
  }
}

Widget currentPage(String route) {
  switch (route) {
    case RouteRoads.tasks:
      return TasksPage();
    case RouteRoads.projects:
      return ProjectsPage();
    case RouteRoads.teams:
      return TeamsPage();
    default:
      return TasksPage();
  }
}
