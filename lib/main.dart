import 'package:FULL_login_setup/screens/transition_pattern.dart';
import 'package:flutter/material.dart';

import 'screens/container_transform.dart';
import 'screens/shared_axis_transition_pattern.dart';
import 'screens/fade_through_transition.dart';
import 'screens/fade_through_transition.dart';
import './my testing transition/main_screen.dart';
import './screens/staggered_animation.dart';

//https://blog.logrocket.com/introducing-flutters-new-animations-package/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
