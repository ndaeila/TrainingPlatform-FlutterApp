import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'insert title',
      debugShowCheckedModeBanner: !kReleaseMode,
      initialRoute: 'Null',
      routes: {
        // add routes
      },
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}