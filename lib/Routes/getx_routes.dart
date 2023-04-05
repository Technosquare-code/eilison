import 'package:elison/Screens/MainScreen.dart';
import 'package:elison/Screens/TrainerHomeScreen.dart';
import 'package:elison/splashscreen.dart';
import 'package:get/get.dart';

import '../Screens/EditProfileScreen.dart';
import '../Screens/GettingStartedScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/OnBoardScreen.dart';
import '../Screens/RegisterScreen.dart';

appRoutes() => [
      GetPage(
        name: '/getting-started',
        page: () => GettingStartScreen(),
      ),
      GetPage(
        name: '/splash',
        page: () => SplashScreen(),
      ),
      GetPage(
        name: '/onboard-screen',
        page: () => OnBoardScreen(),
      ),
      GetPage(
        name: '/login-screen',
        page: () => LoginScreen(),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterScreen(),
      ),
      GetPage(
        name: '/trainer-home',
        page: () => TrainerHomeScreen(),
      ),
      GetPage(
        name: '/user-home',
        page: () => MainScreen(),
      ),
      GetPage(
        name: '/edit-profile-user',
        page: () => EditProfileScreen(),
      ),
    ];
