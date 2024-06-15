import 'package:go_router/go_router.dart';
import 'package:sublime/features/auth/view/login_view.dart';
import 'package:sublime/features/auth/view/register_view.dart';
import 'package:sublime/features/auth/view/welcome_view.dart';
import 'package:sublime/features/home/home.dart';
import 'package:sublime/features/web_view/web_view.dart';
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
        name: otpVerificationView.routeName,
        path: otpVerificationView.route,
        builder: (context, state) => const otpVerificationView(),
      ),
      // register screen
      GoRoute(
        name: RegisterView.routeName,
        path: RegisterView.route,
        builder: (context, state) => const RegisterView(),
      ),
      // web view screen
      GoRoute(
        name: MyWebView.routeName,
        path: MyWebView.route,

        builder: (context, state) {
         final pageData = ((state.extra) as Map<String, dynamic>)["pageTittle"] as String;
          return MyWebView(pageTittle: pageData ,);
        },
      ),
      GoRoute(
        name: HomeView.routeName,
        path: HomeView.route,

        builder: (context, state) {
         
          return HomeView();
        },
      ),
    ],
  );
}
