
import 'package:get/get.dart';

import 'binding/binding.dart';
import 'screen/screen.dart';

final List<GetPage> appPage = [
  GetPage(
      name: SplashScreen.pageId,
      page: ()=> const SplashScreen(),
      binding: SplashBinding()
  ),

  GetPage(
      name: LoginScreen.pageId,
      page: ()=> const LoginScreen(),
      binding: LoginBinding()
  ),

  GetPage(
      name: HomeScreen.pageId,
      page: ()=> const HomeScreen(),
      binding: HomeBinding()
  ),

  GetPage(
      name: CartScreen.pageId,
      page: ()=> CartScreen(),
      binding: CartBinding()
  ),
];