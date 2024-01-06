import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:z_shop/core/consts.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response?> getData(
      {String lang = "en",
      String? token,
      @required String? url,
      @required Map<String, dynamic>? query}) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token
    };

    return await dio?.get(url!, queryParameters: query);
  }

  static Future<Response?> postData(
      {@required String? url,
      Map<String, dynamic>? query,
      String lang = "en",
      String? token,
      @required Map<String, dynamic>? data}) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token
    };
    return await dio?.post(url!, queryParameters: query, data: data);
  }
}
