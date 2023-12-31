import 'package:get/get.dart';
import 'package:study_app/utils/log.dart';

import '../firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  // 获取图片
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }

    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      Log.e(e);
      return null;
    }
  }
}
