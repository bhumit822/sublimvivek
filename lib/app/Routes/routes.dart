import 'package:go_router/go_router.dart';
import 'package:sublime/features/auth/view/login_view.dart';
import 'package:sublime/features/auth/view/welcome_view.dart';
import 'package:sublime/spalsh/view/splash_view.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: SplashView.route,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: SplashView.route,
        name: SplashView.routeName,
        builder: (context, state) => const SplashView(),
      ),

     
      // ///Login
      GoRoute(
        name: LogInAuthView.routeName,
        path: LogInAuthView.route,
        builder: (context, state) => const LogInAuthView(),
      ),
     
      // ///WELCOME VIEW
      GoRoute(
        name: WelcomeView.routeName,
        path: WelcomeView.route,
        builder: (context, state) => const WelcomeView(),
      ),
    ],
  );
}
