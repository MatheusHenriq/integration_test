import 'package:flutter/material.dart';

import 'authentication/view/authentication_view.dart';

class MyApp extends MaterialApp {
  MyApp({
    super.key,
  }) : super(
          title: 'IntegrationTest Flutter with Firebase and Gcloud',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthenticationView(),
        );
}
