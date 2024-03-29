import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Integration Test Home",
        ),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            key: HomeViewConstants.homeCenterWidgetKey,
            child: Text("Here is Home page"),
          ),
        ],
      ),
    );
  }
}

class HomeViewConstants {
  static const Key homeCenterWidgetKey = Key("HomeViewConstants_homeCenterWidgetKey");
}
