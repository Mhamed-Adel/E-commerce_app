import 'package:dio/dio.dart';



// class Crudd {
//   static late Dio dio;

//   static init() {
//     dio = Dio(BaseOptions(
//       baseUrl: 'https://student.valuxapps.com/api/',
//       receiveDataWhenStatusError: true,
//     ));
//   }

// static  Future<Either<StateRequest, Map>> postData({
//     required String url,
//     required Map<String, dynamic> data,
//     String  lang = 'en',
//     String? token,
//   }) async {
//     dio.options.headers = {
//     'Content-Type': 'application/json',
//       'lang': lang,
//       'Authorization': token ?? ''
//     };
//     try {
//       if (await checkInternet()) {
//         var response = await dio.post(url, data: data);
//         if (response.statusCode == 200) {
//           return right(response.data);
//         } else {
//           return  left(StateRequest.serverFaluire);
//         }
//       } else {
//         return  left(StateRequest.internetFaluire);
//       }
//     } catch (_) {
//       return  left(StateRequest.serverException);
//     }
//   }

// static  Future<Either<StateRequest, Response>> putData({
//     required String url,
//     required Map<String, dynamic> data,
//     String? token,
//     String lang = 'en',
//   }) async {
//     dio.options.headers = {
//     'Content-Type': 'application/json',
//       'lang': lang,
//       'Authorization': token ?? ''
//     };
//     try {
//       if (await checkInternet()) {
//         var response = await dio.put(url, data: data);
//         if (response.statusCode == 200) {
//           return right(response.data);
//         } else {
//           return  left(StateRequest.serverFaluire);
//         }
//       } else {
//         return  left(StateRequest.internetFaluire);
//       }
//     } catch (_) {
//       return  left(StateRequest.serverException);
//     }
//   }

// static  Future<Either<StateRequest, Response>> getData({
//     required String url,
//     String? token,
//     String lang = 'en',
//   }) async {
//     dio.options.headers = {
//         'Content-Type': 'application/json',
//           'lang': lang,
//           'Authorization': token?? ''
//         };
//     try {
//       if (await checkInternet()) {
//         var response = await dio.get(url);
//         if (response.statusCode == 200) {
//           return right(response.data);
//         } else {
//           return  left(StateRequest.serverFaluire);
//         }
//       } else {
//         return  left(StateRequest.internetFaluire);
//       }
//     } catch (_) {
//       return  left(StateRequest.serverException);
//     }
//   }
// }

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
