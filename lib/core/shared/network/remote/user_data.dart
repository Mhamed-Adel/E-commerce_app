// ignore: unused_import
import 'package:test_app/core/crud/crud.dart';

import 'end_points.dart';

class ProfileData {
  static updateUser(
      {required String name,
      required String email,
      required String phone,
      required token
      }) async {
    var response =
        await Crudd.putData(url: AppLink.UPDATEPROFILE, token:token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  static getUserData({
    required token
  })async{
    var response =await  Crudd.getData(url: AppLink.PROFILE  , token:token );
    return response.fold((l) => l, (r) => r);
  }
}
