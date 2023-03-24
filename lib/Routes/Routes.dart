import 'package:elison/Screens/AddNewAddressScreen.dart';
import 'package:elison/Screens/AddPostScreen.dart';
import 'package:elison/Screens/AddSessionScreen.dart';
import 'package:elison/Screens/AddressScreen.dart';
import 'package:elison/Screens/AllCategoryProductScreen.dart';
import 'package:elison/Screens/AllSessionScreen.dart';
import 'package:elison/Screens/CartScreen.dart';
import 'package:elison/Screens/CategoryScreen.dart';
import 'package:elison/Screens/CongratulationScreen.dart';
import 'package:elison/Screens/EditProfileScreen.dart';
import 'package:elison/Screens/LoginScreen.dart';
import 'package:elison/Screens/MainScreen.dart';
import 'package:elison/Screens/MySessionScreen.dart';
import 'package:elison/Screens/NotificationScreen.dart';
import 'package:elison/Screens/OnBoardScreen.dart';
import 'package:elison/Screens/OrderDetailScreen.dart';
import 'package:elison/Screens/OrderScreen.dart';
import 'package:elison/Screens/PostDetailScreen.dart';
import 'package:elison/Screens/ProductDetailScreen.dart';
import 'package:elison/Screens/ProductFilterScreen.dart';
import 'package:elison/Screens/PromocodeScreen.dart';
import 'package:elison/Screens/RegisterScreen.dart';
import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/Screens/SupportScreen.dart';
import 'package:elison/Screens/TrainerHomeScreen.dart';
import 'package:elison/Screens/WarrantyManagementScreen.dart';
import 'package:elison/Screens/WhishlistScreen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  OnBoardScreen.routeName: (_) => OnBoardScreen(),
  LoginScreen.routeName: (_) => LoginScreen(),
  RegisterScreen.routeName: (_) => RegisterScreen(),
  MainScreen.routeName: (_) => MainScreen(),
  EditProfileScreen.routeName: (_) => EditProfileScreen(),
  NotificationScreen.routeName: (_) => NotificationScreen(),
  SessionDetailScreen.routeName: (_) => SessionDetailScreen(),
  ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
  PromocodeScreen.routeName: (_) => PromocodeScreen(),
  CongratulationScreen.routeName: (_) => CongratulationScreen(),
  CategoryScreen.routeName: (_) => CategoryScreen(),
  AllCategoryProductScreen.routeName: (_) => AllCategoryProductScreen(),
  AllSessionScreen.routeName: (_) => AllSessionScreen(),
  AddressScreen.routeName: (_) => AddressScreen(),
  AddNewAddressScreen.routeName: (_) => AddNewAddressScreen(),
  OrderScreen.routeName: (_) => OrderScreen(),
  OrderDetailScreen.routeName: (_) => OrderDetailScreen(),
  WishlistScreen.routeName: (_) => WishlistScreen(),
  SupportScreen.routeName: (_) => SupportScreen(),
  WarrantyManagementScreen.routeName: (_) => WarrantyManagementScreen(),
  MySessionScreen.routeName: (_) => MySessionScreen(),
  AddPostScreen.routeName: (_) => AddPostScreen(),
  PostDetailScreen.routeName: (_) => PostDetailScreen(),
  CartScreen.routeName: (_) => CartScreen(),
  ProductFilterScreen.routeName: (_) => ProductFilterScreen(),
  AddSessionScreen.routeName: (_) => AddSessionScreen(),
  TrainerHomeScreen.routeName: (_) => TrainerHomeScreen(),
};
