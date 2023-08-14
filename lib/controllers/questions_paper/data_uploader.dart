import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper_model/question_paper_model.dart';

class DataUploader extends GetxController {
  // 数据加载状态
  final loadingStatus = LoadingStatus.loading.obs;
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  // 加载json文件并且打印出地址
  void uploadData() async {
    // 标志正在加载数据
    loadingStatus.value = LoadingStatus.loading;

    final fireStore = FirebaseFirestore.instance;
    // 加载json文件
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    // 解码json文件
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // 通过代码的方式获取到assest/DB/paper文件夹中所有的json文件地址
    final paperInAssets = manifestMap.keys
        .where((element) =>
            element.startsWith("assets/DB/paper") && element.contains(".json"))
        .toList();

    List<QuestionPaperModel> quesitonPapers = [];
    // 循环读取json文件中的内容
    for (var paper in paperInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      quesitonPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    // print(quesitonPaperModel[0].description);
    var batch = fireStore.batch();

    // paper
    for (var paper in quesitonPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count":
            paper.questions == null ? 0 : paper.questions!.length,
      });

      // questions
      for (var questions in paper.questions!) {
        final questionPath =
            qestionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });

        // answers
        for (var answers in questions.answers) {
          batch
              .set(questionPath.collection("answers").doc(answers.identifier), {
            "identifier": answers.identifier,
            "answer": answers.answer,
          });
        }
      }
    }

    // 将数据提交到firebase数据库
    await batch.commit();

    // 标记数据加载成功
    loadingStatus.value = LoadingStatus.completed;
  }
}
