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
    return Scaffold(
      appBar: AppBar(),
      body: 
       SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<ProfileConroller>(
              builder: (_) => HandlingDataView(
                stateRequest: controller.stateRequest,
                widget:controller.userData != null ? buildProfile(model:controller.userData!) : const LinearProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfile({required UserData model}) {
    
      controller.emailController.text =
                        controller.userData!.email!;
                    controller.nameController.text =
                        controller.userData!.name!;
                    controller.phoneController.text =
                        controller.userData!.phone!;
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
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
            controller: controller.nameController,
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
            controller: controller.emailController,
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
            controller: controller.phoneController,
            type: TextInputType.phone,
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'enter a number';
              }
            },
            label: 'number',
          ),
          const SizedBox(
            height: 15,
          ),
          defaultButton(
                onPress: () {
                  if(formKey.currentState!.validate()){
                    controller.updateProfile();
                  }
                  
                },
                text: 'Update'),
          
        ],
      ),
    );
    
  }
}
