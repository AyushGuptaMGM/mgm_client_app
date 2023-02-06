import 'package:get/get_navigation/src/routes/get_route.dart';
import '../authentication/bindings/auth_bindings.dart';
import '../authentication/route.dart';
import '../authentication/screens/auth_gate.dart';
import '../splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(
        name: '/auth',
        binding: AuthBinding(),
        page: () => const AuthGate(),
        children: AuthRoutes.routes),
    // GetPage(
    //     name: '/dashboard',
    //     page: () => DashboardScreen(),
    //     binding: DashboardBindings()),
    // GetPage(
    //   name: '/orders',
    //   binding: OrdersBindings(),
    //   page: () => const OrdersScreen(),
    //   children: OrdersRoutes.routes,
    // ),
    // GetPage(
    //   name: '/menu',
    //   binding: MenuBindings(),
    //   page: () => MenuScreen(),
    //   children: MenuRoutes.routes,
    // ),
    // GetPage(
    //   name: '/cart',
    //   binding: CartBindings(),
    //   page: () => CartScreen(),
    //   children: CartRoutes.routes,
    // ),
    // GetPage(
    //   name: '/profile',
    //   binding: ProfileBindings(),
    //   page: () => ProfileScreen(),
    //   children: ProfileRoutes.routes,
    // ),
  ];
}
