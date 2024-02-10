import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sonatshi/logic/bindings/auth_bindings.dart';
import 'package:sonatshi/logic/bindings/product_binding.dart';
import 'package:sonatshi/view/screens/auth/forgot_password_screen.dart';
import 'package:sonatshi/view/screens/auth/login_screen.dart';
import 'package:sonatshi/view/screens/auth/signup_screen.dart';
import 'package:sonatshi/view/screens/cart_screen.dart';
import 'package:sonatshi/view/screens/main_screen.dart';
import 'package:sonatshi/view/screens/payment_screen.dart';
import '../logic/bindings/main_binding.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes{
  //initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: ()=> const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: ()=>  LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: ()=>  SignUPScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: ()=>   ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: ()=> MainScreen(),
        bindings :[
          AuthBinding(),
          MainBinding(),
          ProductBindings(),
        ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: ()=>  CartScreen(),
        bindings :[
          AuthBinding(),
          ProductBindings(),
        ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: ()=>  PaymentScreen(),
        bindings :[
          AuthBinding(),
          ProductBindings(),
          MainBinding(),

        ],
    ),

  ];
}

class Routes{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}