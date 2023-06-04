import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/screen/view/api%20helper/news%20Model/news%20model.dart';

class api_helper{
  static api_helper apihelper = api_helper();
  Future<dynamic> ApiHelper()
  async {
    String link = 'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=fd9ed6e076864e0790a584c8ee5004b1';
    var responce = await http.get(Uri.parse(link));
   var JsonData =  jsonDecode(responce.body);
    return JsonData;
  }
}