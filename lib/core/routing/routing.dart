import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarfah/core/networking/firebase_helper.dart';
import 'package:sarfah/core/routing/routs.dart';
import 'package:sarfah/features/home/home_screen.dart';
import 'package:sarfah/features/login/logic/cubit/login_cubit.dart';
import 'package:sarfah/features/login/ui/screens/login_screen.dart';
import 'package:sarfah/features/signup/logic/cubit/signup_cubit.dart';
import 'package:sarfah/features/signup/ui/screens/signup_screen.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: const LoginScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: const HomeScreen(),
                ));
      case Routes.signup:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignupCubit(FirebaseHelper()),
                  child: const SignupScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Route Found"),
      ),
    );
  }
}
