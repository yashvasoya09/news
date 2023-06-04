import 'package:flutter/foundation.dart';
import 'package:news/screen/view/api%20helper/api%20helper.dart';

import '../view/api helper/news Model/news model.dart';

class newsProvider extends ChangeNotifier {
  newsModel data = newsModel();
  int? index;
  Future<void> loadnews() async {
    var dataList = await api_helper.apihelper.ApiHelper();
    data = newsModel.fromJson(dataList);
    notifyListeners();
  }
}
