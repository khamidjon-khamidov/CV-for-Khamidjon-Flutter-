import 'package:cv_for_khamidjon/ui/screens/achievements/view/achievements.dart';
import 'package:cv_for_khamidjon/ui/screens/app_details/view/app_details.dart';
import 'package:cv_for_khamidjon/ui/screens/main/home_pages.dart';
import 'package:cv_for_khamidjon/ui/screens/posts/posts_page.dart';
import 'package:cv_for_khamidjon/ui/screens/projects/projects.dart';
import 'package:cv_for_khamidjon/utils/page_transitions.dart';
import 'package:flutter/material.dart';

import 'ui/screens/skills/skills_page.dart';

class AppRouteSettings {
  static void goToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.homeRoute());
  }

  static void goToAboutMePage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.aboutMeRoute());
  }

  static void goToSkillsPage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.skillsRoute());
  }

  static void goToAchievementsPage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.achievementsRoute());
  }

  static void goToProjectsPage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.projectsRoute());
  }

  static void goToPostsPage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.postsRoute());
  }

  static void goToAppDetailsPage(BuildContext context) {
    Navigator.of(context).pushReplacement(Routes.appDetailsRoute());
  }
}

class Routes {
  static Route<void> aboutMeRoute() => PageTransition.slide(
        const AboutMePage(),
        const RouteSettings(name: _aboutMePage),
      );

  static Route<void> homeRoute() => PageTransition.slide(
        const HomePage(),
        const RouteSettings(name: _homePage),
      );

  static Route<void> skillsRoute() => PageTransition.slide(
        const SkillsPage(),
        const RouteSettings(name: _skillsPage),
      );

  static Route<void> achievementsRoute() => PageTransition.slide(
        const AchievementsPage(),
        const RouteSettings(name: _achievementsPage),
      );

  static Route<void> projectsRoute() => PageTransition.slide(
        const ProjectsPage(),
        const RouteSettings(name: _projectsPage),
      );

  static Route<void> postsRoute() => PageTransition.slide(
        const PostsPage(),
        const RouteSettings(name: _postsPage),
      );

  static Route<void> appDetailsRoute() => PageTransition.slide(
        const AppDetailsPage(),
        const RouteSettings(name: _appDetailsPage),
      );

  static const String _homePage = '/home';
  static const String _aboutMePage = '/aboutMePage';
  static const String _skillsPage = '/skills';
  static const String _achievementsPage = '/achievements';
  static const String _projectsPage = '/projects';
  static const String _postsPage = '/posts';
  static const String _appDetailsPage = '/appDetails';
}
