import 'package:fluent_ui/fluent_ui.dart';
import 'package:projecthomestrategies_admin/bloc/model/api_response.dart';
import 'package:projecthomestrategies_admin/bloc/provider/authentication_state.dart';
import 'package:projecthomestrategies_admin/pages/authentication/signin_page.dart';
import 'package:projecthomestrategies_admin/service/authentication_service.dart';
import 'package:projecthomestrategies_admin/widgets/global/loader.dart';
import 'package:projecthomestrategies_admin/widgets/navigation/dashboard_navigator.dart';
import 'package:provider/provider.dart';

class AuthenticationHandler extends StatelessWidget {
  const AuthenticationHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationState(),
      builder: (context, _) => Selector<AuthenticationState, Future<bool>>(
        selector: (context, state) => state.tokenExpired(),
        builder: (context, tokenExpired, _) => FutureBuilder<bool>(
          future: tokenExpired,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              if (snapshot.hasData) {
                return const SignInPage();
              } else {
                return const DashboardNavigator(
                  appTitle: "Dashboard",
                );
              }
            }
          },
        ),
      ),
    );
  }
}
