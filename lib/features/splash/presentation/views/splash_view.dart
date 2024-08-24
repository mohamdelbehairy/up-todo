import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import '../widgets/splash_text_animation.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvg(
                svgModel: SvgModel(
                    image: Assets.imagesSplash, height: 100.46, width: 95.03)),
            const SizedBox(height: 30),
            const SplashTextAnimation()
          ],
        ),
      ),
    );
  }
}
