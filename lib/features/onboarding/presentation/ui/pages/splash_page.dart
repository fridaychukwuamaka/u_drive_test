import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/extensions/extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const SizedBox.shrink();
    }
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: context.width * 0.5,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
