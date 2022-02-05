import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:projecthomestrategies_admin/widgets/navigation/dashboard_navigator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.centerLeft,
            color: const Color(0xFF047769),
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
                    placeholder: "E-Mail",
                    validator: (text) {
                      if (text == null || text.isEmpty) return 'E-Mail angeben';
                    },
                  ),
                  TextFormBox(
                    placeholder: "Passwort",
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return 'Passwort angeben';
                    },
                  ),
                  Button(
                    child: const Text("Anmelden"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DashboardNavigator(
                            appTitle: "Dashbaord",
                          ),
                        ),
                      );
                    },
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
