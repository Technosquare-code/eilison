import 'package:elison/Screens/MainScreen.dart';
import 'package:elison/Screens/TrainerHomeScreen.dart';
import 'package:elison/Screens/change_password.dart';
import 'package:elison/splashscreen.dart';
import 'package:get/get.dart';

import '../Screens/AddNewAddressScreen.dart';
import '../Screens/AddSessionScreen.dart';
import '../Screens/AddressScreen.dart';
import '../Screens/CartScreen.dart';
import '../Screens/CategoryScreen.dart';
import '../Screens/EditProfileScreen.dart';
import '../Screens/GettingStartedScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/NotificationScreen.dart';
import '../Screens/OnBoardScreen.dart';
import '../Screens/ProductDetailScreen.dart';
import '../Screens/ProductFilterScreen.dart';
import '../Screens/PromocodeScreen.dart';
import '../Screens/ShowProductScreen.dart';
import '../Screens/RegisterScreen.dart';
import '../Screens/SupportHistoryScreen.dart';
import '../Screens/SupportScreen.dart';
import '../Screens/TrainerProfileScreen.dart';
import '../Screens/WarrantyManagementScreen.dart';
import '../Screens/WhishlistScreen.dart';

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
        name: '/trainer-profile-screen',
        page: () => TrainerProfileScreen(),
      ),
      GetPage(
        name: '/user-home',
        page: () => MainScreen(),
      ),
      GetPage(
        name: '/edit-profile-user',
        page: () => EditProfileScreen(),
      ),
      GetPage(
        name: '/add-session',
        page: () => AddSessionScreen(),
      ),
      GetPage(
        name: '/notification',
        page: () => NotificationScreen(),
      ),
      GetPage(
        name: '/cart',
        page: () => CartScreen(),
      ),
      GetPage(
        name: '/change-pass',
        page: () => ChangePassword(),
      ),
      GetPage(
        name: '/warrenty-screen',
        page: () => WarrantyManagementScreen(),
      ),
      GetPage(
        name: '/address-page',
        page: () => AddressScreen(),
      ),
      GetPage(
        name: '/add-address',
        page: () => AddNewAddressScreen(),
      ),
      GetPage(
        name: '/category-screen',
        page: () => CategoryScreen(),
      ),
      GetPage(
        name: '/support-screen',
        page: () => SupportScreen(),
      ),
      GetPage(
        name: '/wishlist-screen',
        page: () => WishlistScreen(),
      ),
      GetPage(
        name: '/promocode-screen',
        page: () => PromocodeScreen(),
      ),
      GetPage(
        name: '/previous-support-screen',
        page: () => SupportHistoryScreen(),
      ),
      GetPage(
        name: '/show-products-screen',
        page: () => ShowProductScreen(),
      ),
      GetPage(
        name: '/product-detail-screen',
        page: () => ProductDetailScreen(),
      ),
      GetPage(
        name: '/product-filter-screen',
        page: () => ProductFilterScreen(),
      ),
    ];
