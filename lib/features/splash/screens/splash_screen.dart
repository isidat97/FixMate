import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _logoScale;

  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _logoScale = Tween<double>(
      begin: .7,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller.forward();

    Timer(
      const Duration(seconds: 3),
      () {
        // TODO
        // Navigator.pushReplacementNamed(context, '/onboarding');
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget ripple(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(opacity),
          width: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [

            ripple(850, .04),

            ripple(620, .06),

            ripple(420, .08),

            FadeTransition(
              opacity: _fade,
              child: ScaleTransition(
                scale: _logoScale,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 163, 77, 77),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.12),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(26),
                        child: Image.asset(
                          "assets/images/fixmate_logo.png",
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      "FixMate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Expert Services. Delivered.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.90),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 130,
              child: SizedBox(
                height: 34,
                width: 34,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      const AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Colors.white.withOpacity(.2),
                ),
              ),
            ),

            Positioned(
              bottom: 45,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [

                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 18,
                    ),

                    SizedBox(width: 8),

                    Text(
                      "MADE IN INDIA",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}