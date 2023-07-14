// import 'package:get/get.dart';
// import 'package:test_app/core/shared/network/remote/end_points.dart';

// import '../../../crud/crud.dart';
// import '../../../middleware/middleware.dart';

// import '../../../crud/crud.dart';
// import '../../components/constants.dart';
// import 'end_points.dart';

import 'package:test_app/core/crud/crud.dart';

import '../../components/constants.dart';
import 'end_points.dart';

class HomeData {
  

  
  
  
  getData() async {
  var response =  await Crudd.getData( url:AppLink.CATEGORIES,token:token);
    return response.fold((l) => l, (r) => r);
    
  }

  
}

// import 'package:test_app/core/crud/crud.dart';
// import 'package:test_app/core/shared/components/constants.dart';

// class ProductData {

// static  getData(productId) async {
//     var response = await Crudd.getData(url: 'products/$productId',token: token);
//     return response.fold((l) => l, (r) => r);
//   }
// }