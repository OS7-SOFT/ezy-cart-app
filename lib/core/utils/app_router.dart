import 'package:ezy_cart_app/core/screens/home_screen.dart';
import 'package:ezy_cart_app/core/screens/introduction_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => IntroductionWidget(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
