import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../services/services.dart';
MyServices myServices = Get.find();

const kdefaultColor = Color(0xFF007575);

const kdefaultTextColor = Color(0xFF264446);


String? token = myServices.sharedPreferences.getString('token');
