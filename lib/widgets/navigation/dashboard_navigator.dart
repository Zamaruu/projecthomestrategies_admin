import 'package:fluent_ui/fluent_ui.dart';
import 'package:projecthomestrategies_admin/pages/dashboard/dashboard_page.dart';
import 'package:projecthomestrategies_admin/pages/household/household_page.dart';
import 'package:projecthomestrategies_admin/pages/notifications/notification_page.dart';
import 'package:projecthomestrategies_admin/pages/settings/settings_page.dart';
import 'package:projecthomestrategies_admin/pages/user/user_page.dart';
import 'package:projecthomestrategies_admin/widgets/navigation/navigation_avatar.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class DashboardNavigator extends StatefulWidget {
  final String appTitle;

  const DashboardNavigator({Key? key, required this.appTitle})
      : super(key: key);

  @override
  _DashboardNavigatorState createState() => _DashboardNavigatorState();
}

class _DashboardNavigatorState extends State<DashboardNavigator> {
  late int navIndex;

  @override
  void initState() {
    super.initState();
    navIndex = 1;
  }

  void setIndex(int newIndex) {
    setState(() {
      navIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.appTitle,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const NavigationAvatar(),
            ],
          ),
        ),
      ),
      pane: NavigationPane(
        selected: navIndex,
        onChanged: (index) => setIndex(index),
        displayMode: PaneDisplayMode.auto,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.view_dashboard),
            title: const Text('Dashboard'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.home_group),
            title: const Text('Haushalte'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.group),
            title: const Text('Benutzer'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.message),
            title: const Text('Benachrichtigungen'),
          ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Einstellungen'),
          ),
          PaneItemAction(
            icon: const Icon(FluentIcons.open_source),
            title: const Text('Quell Code'),
            onTap: () {
              url_launcher.launch('https://github.com/bdlukaa/fluent_ui');
            },
          ),
        ],
      ),
      content: NavigationBody(
        index: navIndex,
        children: [
          const DashboardPage(),
          const HouseholdPage(),
          UserPage(),
          const NotificationPage(),
          const SettingsPage(),
        ],
      ),
    );
  }
}
