import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widgets/app_circle_button.dart';

import '../../configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              // text
              const Text(
                "This is a study app, You can use it you want. If you understand how this works, you would be able to scale it. With this you will master firebase backend and flutter frount end.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // button
              AppCircleButton(
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                ),
                onTap: () => Get.toNamed('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
