import 'package:fluent_ui/fluent_ui.dart';
import 'package:projecthomestrategies_admin/pages/authentication/signin_page.dart';
import 'package:projecthomestrategies_admin/pages/dashboard/dashboard_page.dart';
import 'package:projecthomestrategies_admin/utils/dashboard_theme.dart';
import 'package:projecthomestrategies_admin/widgets/navigation/dashboard_navigator.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const HomeStrategiesAdmin());
}

class HomeStrategiesAdmin extends StatelessWidget {
  final appTitle = "Home Strategies Admin Dashboard";

  const HomeStrategiesAdmin({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardTheme(),
      builder: (context, _) {
        return Consumer<DashboardTheme>(
          builder: (context, theme, child) {
            return FluentApp(
              title: appTitle,
              debugShowCheckedModeBanner: false,
              themeMode: theme.mode,
              theme: ThemeData(
                accentColor: theme.systemAccentColor,
                visualDensity: VisualDensity.standard,
                focusTheme: FocusThemeData(
                  glowFactor: is10footScreen() ? 2.0 : 0.0,
                ),
              ),
              home: const SignInPage(),
              // home: DashboardNavigator(
              //   appTitle: appTitle,
              // ),
            );
          },
        );
      },
    );
  }
}
