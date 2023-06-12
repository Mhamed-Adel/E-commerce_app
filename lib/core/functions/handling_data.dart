import 'package:test_app/core/crud/state_status.dart';

handleData(response){
  if(response is  StateRequest  ){
    return response;
  }else{
    return StateRequest.success;
  }
}