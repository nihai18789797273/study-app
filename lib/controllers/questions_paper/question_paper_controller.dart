import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model/question_paper_model.dart';
import 'package:study_app/utils/log.dart';

import '../../firebase_ref/references.dart';
import '../../services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  // 所有的试卷封面图片地址，从fireStorage获取
  final allPapersImgs = <String>[].obs;
  // 所有的试题数据，从firebase数据库获取
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      // 从firebase中获取当前集合中的所有的数据
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      // 将获取到的数据通过定义的fromSnapshot方法转为对应的对象
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      // 将此列表中的所有现有项目替换为items
      allPapers.assignAll(paperList);
      // 通过试卷标题来获取封面图片地址，因为在fireStorage中存储的图片名称就是试卷的标题
      for (var paper in allPapers) {
        // 从fireStorage中获取图片地址
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        allPapersImgs.add(imgUrl!);
      }
      // 再次赋值是为了防止存在旧数据???
      allPapers.assignAll(paperList);
    } catch (e) {
      Log.e(e);
    }
  }
}
