import 'package:acecook/src/pages/cart/cart.dart';
import 'package:acecook/src/pages/main/tabs_screen.dart';
import 'package:acecook/src/pages/product/list_product.dart';
import 'package:acecook/src/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:acecook/src/pages/login/login.dart';
import 'package:go_router/go_router.dart';

const String rLoginScreen = '/';
const String nLoginScreen = 'LoginScreen';
const String rHomeScreen = '/home';
const String nHomeScreen = 'HomeScreen';
const String rCartScreen = '/cart';
const String nCartScreen = 'CartScreen';
const String rListProductScreen = '/products';
const String nListProductScreen = 'ListProductScreen';

final GoRouter appRoute = GoRouter(
  // main routes that can be accessed directly at app launch
  navigatorKey: NavigationService.navigatorKey,
  routes: <GoRoute>[
    GoRoute(
      path: rLoginScreen,
      name: nLoginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: rHomeScreen,
      name: nHomeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return TabsScreenView(
          index: state.extra != null ? state.extra as int : 0,
        );
      },
    ),
    GoRoute(
      path: rListProductScreen,
      name: nListProductScreen,
      builder: (BuildContext context, GoRouterState state) {
        return ListProduct();
      },
    ),
    GoRoute(
      path: rCartScreen,
      name: nCartScreen,
      builder: (BuildContext context, GoRouterState state) {
        return CartScreen();
      },
    ),
  ],
);
