import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/core/crud/state_status.dart';

import '../functions/check_internet.dart';



class Crudd {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
    ));
  }

static  Future<Either<StateRequest, Map>> postData({
    required String url,
    required Map<String, dynamic> data,
    String  lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
    'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    try {
      if (await checkInternet()) {
        var response = await dio.post(url, data: data);
        if (response.statusCode == 200) {

          return Right(response.data);
        } else {
          return  const Left(StateRequest.serverFaluire);
        }
      } else {
        return  const Left(StateRequest.internetFaluire);
      }
    } catch (e) {
      print('errooooooooooor : ${e.toString()}');
      return  const Left(StateRequest.serverException);
    }
  }
static  Future<Either<StateRequest, Map>> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String  lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
    'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    try {
      if (await checkInternet()) {
        var response = await dio.delete(url, data: data);
        if (response.statusCode == 200) {

          return Right(response.data);
        } else {
          return  const Left(StateRequest.serverFaluire);
        }
      } else {
        return  const Left(StateRequest.internetFaluire);
      }
    } catch (e) {
      print('errooooooooooor : ${e.toString()}');
      return  const Left(StateRequest.serverException);
    }
  }

static  Future<Either<StateRequest, Map<String,dynamic>>> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {
    'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    try {
      if (await checkInternet()) {
        var response = await dio.put(url, data: data);
        if (response.statusCode == 200) {
          return Right(response.data);
        } else {
          return  const Left(StateRequest.serverFaluire);
        }
      } else {
        return  const Left(StateRequest.internetFaluire);
      }
    } catch (_) {
      return  const Left(StateRequest.serverException);
    }
  }

static  Future<Either<StateRequest,Map<String,dynamic>>> getData({
    required String url,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {
        'Content-Type': 'application/json',
          'lang': lang,
          'Authorization': token?? ''
        };
    try {
      if (await checkInternet()) {
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          return Right(response.data);
        } else {
          return  const Left(StateRequest.serverFaluire);
        }
      } else {
        return  const Left(StateRequest.internetFaluire);
      }
    } catch (e) {
      debugPrint('errorrrrrrrrrrrr${e.toString()}');
      return  const Left(StateRequest.serverException);
    }
  }
}

class Crud {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      
      
    ));
    
  }

  //*************get***********//

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return  dio.get(
      url,
      queryParameters: query,
    );
    
  }

  //*************post***********//
  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return  dio.post(url, queryParameters: query, data: data);
  }

  //*************put***********//

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return  dio.put(url, queryParameters: query, data: data);
  }
}
