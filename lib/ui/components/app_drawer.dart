import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/preferences_provider.dart';
import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/routes.dart';
import 'package:cv_for_khamidjon/ui/components/theme_mode_changer.dart';
import 'package:cv_for_khamidjon/ui/theme/images.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context),
          _createDrawerItem(
            context: context,
            icon: Icons.contacts,
            text: S.current.page_home,
            onTap: () => AppRouteSettings.goToHomePage(context),
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.event,
            text: S.current.page_about_me,
            onTap: () => AppRouteSettings.goToAboutMePage(context),
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.note,
            text: S.current.page_skills,
            onTap: () => AppRouteSettings.goToSkillsPage(context),
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.collections_bookmark,
            text: S.current.page_achievements,
            onTap: () => AppRouteSettings.goToAchievementsPage(context),
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.face,
            text: S.current.page_projects,
            onTap: () => AppRouteSettings.goToProjectsPage(context),
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.account_box,
            text: S.current.page_posts,
            onTap: () => AppRouteSettings.goToPostsPage(context),
          ),
          _createDrawerItem(
              context: context,
              icon: Icons.stars,
              text: S.current.page_app_details,
              onTap: () => AppRouteSettings.goToAppDetailsPage(context)),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              S.current.more_options,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline4?.color ??
                      Theme.of(context).primaryColor),
            ),
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.bug_report,
            text: S.current.exit,
          ),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Theme.of(context).appBarTheme.backgroundColor),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: <Widget>[
              Spacer(flex: 1),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundImage: AssetImage(AppImages.myPicture3x4),
                ),
              ),
              Spacer(flex: 1),
              Text(
                S.current.my_name,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(flex: 1),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container()),
              Column(
                children: [
                  ThemeModeChanger(),
                  DropdownButton<String>(
                    value: PreferencesProvider.inMemoryLocale.countryCode?.toUpperCase() ?? 'EN',
                    elevation: 16,
                    style: Theme.of(context).textTheme.subtitle1,
                    underline: SizedBox(),
                    onChanged: (String? data) {},
                    items:
                        S.delegate.supportedLocales.map<DropdownMenuItem<String>>((Locale value) {
                      simpleLogger.d('Got locale: ${value.languageCode}');
                      return DropdownMenuItem<String>(
                        value: value.languageCode.toUpperCase(),
                        child: Text(value.languageCode.toUpperCase()),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
