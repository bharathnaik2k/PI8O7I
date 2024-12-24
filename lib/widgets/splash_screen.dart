import 'package:assignment_prototype_pi8o7i/widgets/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  //this Fun. Navigate Splash Screen(after 2 second) To Home Screen
  _naviScreenFun(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreenWidget(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _naviScreenFun(context);
    return const Scaffold(
      body: Center(
        child: Icon(Icons.android, size: 40),
      ),
    );
  }
}
