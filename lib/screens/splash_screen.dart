import 'package:flutter/material.dart';
import 'package:sclp_final/constants/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Image.asset(AppAssets.images.logo),
    );
  }
}
