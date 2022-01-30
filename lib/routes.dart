import 'package:flutter/material.dart';
import 'package:todo_app/view/navbar_cubit/bottom_nav_bar_view.dart';
import 'package:todo_app/view/screens/home_page/home.dart';
import 'package:todo_app/view/screens/no_tasks/no_tasks_page.dart';
import 'package:todo_app/view/screens/onboarding/onboarding_page.dart';
import 'package:todo_app/view/screens/taskas_page/tasks_page.dart';

class RouteManager {
  static generaRouter(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case '/navbar':
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeBodyPage());
      case '/tasks':
        return MaterialPageRoute(builder: (_) => const TasksPage());
    }
  }
}
