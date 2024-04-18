import 'package:accurate_test/const/color.dart';
import 'package:accurate_test/const/image.dart';
import 'package:accurate_test/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorApp.lightBlue1, ColorApp.lightBlue2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageApp.listPeople),
              ElevatedButton(
                onPressed: () => context.goNamed(RouterName.home),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.lightBlue1),
                child: const Text('Mulai'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
