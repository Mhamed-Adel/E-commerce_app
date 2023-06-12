// import 'package:get/get.dart';
// import 'package:test_app/core/shared/network/remote/end_points.dart';

// import '../../../crud/crud.dart';
// import '../../../middleware/middleware.dart';

// class HomeData {
//   MyMiddleware middleware = Get.put(MyMiddleware());
//   Crud crud;
//   HomeData(this.crud);
//   getData() async {
//     await Crud.getData( url:AppLink.HOME,token:middleware.token);
    
//   }
// }

// import 'package:test_app/core/crud/crud.dart';
// import 'package:test_app/core/shared/components/constants.dart';

// class ProductData {

// static  getData(productId) async {
//     var response = await Crudd.getData(url: 'products/$productId',token: token);
//     return response.fold((l) => l, (r) => r);
//   }
// }