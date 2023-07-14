import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';

class GetCartData {
  static getCartData() async {
    var response = await Crudd.getData(url: AppLink.CART, token: token);
    return response.fold((l) => l, (r) => r);
  }

  static addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    var response = await Crudd.postData(
        url: AppLink.Address,
        data: {
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'notes': notes,
          'latitude': '3123123',
          'longitude': '2121545',
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  static getAddress(token) async {
    var response = await Crudd.getData(url: AppLink.Address, token: token);
    return response.fold((l) => l, (r) => r);
  }
  
 static deleteData(int addressid,token) async {
    var response =
        await Crudd.deleteData(url: 'addresses/$addressid',token: token);
    return response.fold((l) => l, (r) => r);
  }

  static addOrder({required token, required int id}) async {
    var response =
        await Crudd.postData(url: AppLink.Orders, token: token, data: {
      "id": id,
      "payment_method": 1,
      "use_points": false,
    });
    return response.fold((l) => l, (r) => r);
  }
}
