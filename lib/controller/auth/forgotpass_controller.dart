import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPassController extends GetxController{
  forgotPass();

  getToVerify();
  
  
}

class ForgotPassControllerImplemt extends ForgotPassController{
  
  
  bool isActive = true;
   Color? color ;

  void changeColor(){

  color = isActive? Colors.teal : Colors.white;
  update();
  }
  
  @override
  forgotPass() {
    
  }
  
  @override
  getToVerify() {
  
  }
}