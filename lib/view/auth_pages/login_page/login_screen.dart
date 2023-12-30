import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/auth/login_controller.dart';
import 'package:test_app/core/crud/state_status.dart';

import '../../layout/home_layout.dart';
import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
final  AppLoginControllerImplemt controller = Get.put(AppLoginControllerImplemt());

  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Image.asset('assets/images/egFlag.png'),
        actions: [
          defaultTextButton(
              text: 'SKIP   ',
              onPressed: () {
                Get.to(()=>const HomeLayout());
              },
              fontSize: 20)
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: kdefaultTextColor,
                                fontFamily: 'Sora',
                                fontSize: 32,
                                fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Please Enter Your Details',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: kdefaultTextColor,
                            fontFamily: 'Sora',
                            fontSize: 16)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultText(text: 'Email', size: 14,color: Colors.black54),
                    const SizedBox(
                      height: 2,
                    ),
                    defaultFormField(
                        controller: controller.emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        label: 'Email Address',
                        ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    defaultText(text: 'Password', size: 14,color: Colors.black54),
                    const SizedBox(
                      height: 2,
                    ),
                    defaultFormField(
                      controller: controller.passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                      
                      isPassword: true,
                      suffixPress: () {},
                    ),
                    defaultTextButton(
                        text: 'Forgot password ?',
                        onPressed: () {
                        controller.goToForgotPass();
                        },
                        fontSize: 14),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<AppLoginControllerImplemt>(
                      builder:(controller) => ConditionalBuilder(
                        condition:  controller.stateRequest != StateRequest.loading,
                        fallback: (context) => const Center(child: CircularProgressIndicator(),),
                        builder:(context) => defaultButton(
                            onPress: () {
                            if (formKey.currentState!.validate()) {
                            controller.userLogin();
                            
                            }
                            
                            },
                            text: 'Sign in',
                            textColor: Colors.white,
                            size: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultButton(
                      onPress: () {},
                      background: Colors.white,
                      size: 16,
                      text: 'Sign in with google',
                      textColor: kdefaultColor
                    ),
                    const SizedBox(height: 30,),
                    
                    
                  ]),
                  
            ),
          ),
        ),
      ),
    bottomNavigationBar: BottomAppBar(
      elevation: 0.0,
      color:  const Color(0xFFF9F9F9),
      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(
                            text: 'Don\'t have an account? ',
                            size: 16,
                            weight: FontWeight.bold,
                            color: Colors.grey
                            
                            ),
                        TextButton(
                            onPressed: () {},
                            child: defaultTextButton(
                              text: 'SignUp',
                              onPressed: () {
                              controller.goToSignUp();
                              },
                              fontSize: 16,
                            )),
                      ],
                    ),
    ),
    );
  }
}
