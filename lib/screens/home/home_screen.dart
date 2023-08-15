import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/questions_paper/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();

    return Scaffold(
      body: Obx(
        () => ListView.separated(
          // 列表子项
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/app_splash_logo.png"),
                  imageUrl: questionPaperController.allPapers[index].imageUrl!,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
          // 分隔符
          separatorBuilder: ((context, index) => const SizedBox(
                height: 20,
              )),
          itemCount: questionPaperController.allPapers.length,
        ),
      ),
    );
  }
}
