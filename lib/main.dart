// Import other stuff
import 'dart:math';

// Import firebase
import 'package:firebase_core/firebase_core.dart';

// Import necessary material
import 'package:californiaefficiencygroup/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'commons/widgets/nav-drawer.dart';
import 'commons/widgets/get-text.dart';

// Terminal Comnmands:
//  check available devices: flutter devices
//  run:
//   chrome: flutter run -d chrome --debug --web-hostname localhost --web-port 8080
//   ios: flutter run
//   verbose: -v

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [],
      child: App(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'California Efficiency Group',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Colors.white),
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error: " + snapshot.error.toString());
            return const Text("Something went wrong!");
          } else if (snapshot.hasData) {
            return const MyHomePage(title: 'California Efficiency Group');
          } else {
            // Show Splash Screen
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const bodyTextElement =
        ReadTextFile(textURL: './assets/text/DummyText.txt');
    const titleMargin = 10;

    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 2.0),
              blurRadius: 8.0,
            )
          ]),
          child: AppBar(
            elevation: 0.0,
            title: SizedBox(
              height: kToolbarHeight - titleMargin,
              child: Row(
                children: [
                  Image.asset('./assets/images/CEG-icon.png'),
                  const Text("  "),
                  Image.asset('./assets/images/CEG-title.png'),
                ],
              ),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            bodyTextElement,
          ],
        ),
      ),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset('./assets/images/CEG-title.png'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // body children go here
        ),
      ),
    );
  }
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
