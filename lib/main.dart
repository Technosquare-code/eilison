import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elison/Routes/Routes.dart';
import 'package:elison/Screens/GettingStartedScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EILISON',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
        accentColor: Colors.white,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        buttonTheme: ButtonThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: GettingStartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
