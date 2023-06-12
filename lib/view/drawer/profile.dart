import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/models/login_model.dart';

import '../../controller/layout_controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileConroller> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileConroller());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  GetBuilder<ProfileConroller>(
            builder:(controller) => HandlingDataView(
                          stateRequest: controller.stateRequest!,
                          widget: buildProfile(controller.loginModel.data),
                          ),
          ),
            
            
          
                  
        ),
      ),
    );
  }

  Widget buildProfile(UserData? model) {
    
    if(model != null) {
    return  Column(
                              children: [
                                CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage('${model.image}'),
                                ),
                                Text('${model.name}'),
                                const SizedBox(
                                  height: 20,
                                ),
                                defaultText(text: 'Update Your Data', size: 18),
                                const SizedBox(
                                  height: 10,
                                ),
                                defaultFormField(
                                  controller: controller.nameConroller,
                                  type: TextInputType.name,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'enter a name';
                                    }
                                  },
                                  label: 'name',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                defaultFormField(
                                  controller: controller.emailConroller,
                                  type: TextInputType.emailAddress,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'enter a name';
                                    }
                                  },
                                  label: 'email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                defaultFormField(
                                  controller: controller.phoneConroller,
                                  type: TextInputType.phone,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'enter a number';
                                    }
                                  },
                                  label: 'number',
                                ),
                              ],
                            );
    }else {
      return const LinearProgressIndicator();
    }
  
  }
}
