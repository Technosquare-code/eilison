import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elison/Routes/Routes.dart';
import 'package:elison/Screens/GettingStartedScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Routes/getx_routes.dart';
import 'Utils/Colors.dart';

Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
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
    return GetMaterialApp(
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
      // routes: routes,
      initialRoute: '/splash',
      // home: '',
      defaultTransition: Transition.fade,
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
