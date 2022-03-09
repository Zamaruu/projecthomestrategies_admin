import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:projecthomestrategies_admin/bloc/provider/authentication_state.dart';
import 'package:projecthomestrategies_admin/utils/api_response_message.dart';
import 'package:projecthomestrategies_admin/widgets/navigation/dashboard_navigator.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late bool isLoading;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    isLoading = false;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> signIn(BuildContext ctx) async {
    toggleLoading();

    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    var response = await ctx
        .read<AuthenticationState>()
        .signInWithCredentials(email, password);

    toggleLoading();

    debugPrint(response.message);
    if (response.statusCode == 200) {
      navigateToDashboard();
    }
    ApiResponseMessage(response: response, context: ctx).showToast();
  }

  void navigateToDashboard() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DashboardNavigator(
          appTitle: "Dashboard",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          ),
          Center(
            child: Container(
              width: 320,
              height: 400,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xfff2f2f2),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffbdbdbd),
                    blurRadius: 10,
                    spreadRadius: 4,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Home Strategies Admin Dashboard"),
                  TextFormBox(
                    controller: emailController,
                    readOnly: isLoading,
                    placeholder: "E-Mail",
                    validator: (text) {
                      if (text == null || text.isEmpty) return 'E-Mail angeben';
                    },
                  ),
                  TextFormBox(
                    controller: passwordController,
                    readOnly: isLoading,
                    placeholder: "Passwort",
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Passwort angeben';
                      }
                    },
                  ),
                  Button(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Anmelden"),
                        if (isLoading) const SizedBox(width: 12),
                        if (isLoading) const ProgressRing(),
                      ],
                    ),
                    onPressed: isLoading ? null : () => signIn(context),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
