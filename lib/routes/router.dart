import 'package:accurate_test/pages/addUser/screen/add_user.dart';
import 'package:accurate_test/pages/home/screen/home.dart';
import 'package:accurate_test/pages/splash/screen/splash.dart';
import 'package:go_router/go_router.dart';

part 'router_name.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: RouterName.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
      path: '/home',
      name: RouterName.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'addUser',
          name: RouterName.addUser,
          builder: (context, state) => AddUserScreen(),
        )
      ])
]);
