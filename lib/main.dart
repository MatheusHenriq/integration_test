import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integrationtest/src/app.dart';

String? maina;
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
