import 'package:flutter/material.dart';
import 'package:todo_app/view/cubit/bottom_nav_bar_view.dart';
import 'package:todo_app/view/screens/home_page/home_page.dart';
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
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/tasks':
        return MaterialPageRoute(builder: (_) => const TasksPage());
    }
  }
}
