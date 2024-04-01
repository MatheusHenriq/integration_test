import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/regex/regex.dart';
import '../../home/view/home_view.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});
  static const String routeName = "/authentitaction";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Integration Test Login",
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: AuthenticationViewConstants.userNameKey,
                decoration: const InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                ),
                validator: (value) {
                  return (value?.isEmpty ?? false) || (!Regex.emailRegex.hasMatch(value ?? ""))
                      ? 'Enter a valid email address'
                      : null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                key: AuthenticationViewConstants.passwordKey,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  return (value?.isEmpty ?? false) || (value?.length ?? 0) < 8 ? 'Enter a valid password' : null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                key: AuthenticationViewConstants.loginButtonKey,
                child: const Text("Sign In"),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.goNamed(HomeView.routeName);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

abstract class AuthenticationViewConstants {
  static const Key userNameKey = Key("AuthenticationView_userNameKey");
  static const Key passwordKey = Key("AuthenticationView_passwordKey");
  static const Key loginButtonKey = Key("AuthenticationView_loginButtonKey");
}
