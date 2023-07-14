import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/core/shared/network/remote/user_data.dart';
import 'package:test_app/models/login_model.dart';
import '../../core/functions/handling_data.dart';

class ProfileConroller extends GetxController{
  @override
  void onInit() {
    getProfileData();
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }
var  nameController = TextEditingController();
var  emailController = TextEditingController();
var  phoneController = TextEditingController();



    StateRequest stateRequest = StateRequest.none;
  UserData? userData;

  getProfileData() async{
  stateRequest = StateRequest.loading;
  var response =await ProfileData.getUserData(token: token);
  stateRequest = handleData(response);
  if(StateRequest.success == stateRequest){
  if(response['status'] == true){
    userData = UserData.fromJson(response['data']);
    stateRequest = StateRequest.success;
  }else{
    stateRequest = StateRequest.failure;
    if (kDebugMode) {
      print('Failed to get user data ');
    }
  }
  }
  update();
  }





  updateProfile()async{
  stateRequest = StateRequest.loading;
  var response =await  ProfileData.updateUser(
    name: nameController.text , 
    email: emailController.text,
   phone: phoneController.text ,
   token: token
   );
   stateRequest = handleData(response);
   if(StateRequest.success == stateRequest){
  if(response['status'] == true){
    userData = UserData.fromJson(response['data']);
    getProfileData();
    Get.defaultDialog(middleText: response['message'],);
    stateRequest = StateRequest.success;
  }else{
    if (kDebugMode) {
      print('failed to Update Data');
    }
    stateRequest = StateRequest.failure;
  }
  }
  update();
}
 late File profileImage;
 final picker = ImagePicker();
 Future<void> getImageFromGallery() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      List<int> imageBytes = profileImage.readAsBytesSync();
    var  base64Image = base64Encode(imageBytes);
      print('***************************');
      print(base64Image);
      print('***************************');
      
    } else {
      print('No image selected');
     
    }
  }
}