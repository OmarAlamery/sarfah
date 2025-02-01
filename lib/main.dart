import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sarfah/core/routing/routing.dart';
import 'package:sarfah/firebase_options.dart';
import 'package:sarfah/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    routing: Routing(),
  ));
}
