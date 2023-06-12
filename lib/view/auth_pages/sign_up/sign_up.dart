import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/auth/signup_controller.dart';
import 'package:test_app/view/layout/home_layout.dart';
import 'package:test_app/view/auth_pages/login_page/login_screen.dart';

import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
final  formKey = GlobalKey<FormState>();

final  SignupControllerImp controller = Get.put(SignupControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Image.asset('assets/images/egFlag.png'),
        actions: [
          defaultTextButton(
              text: 'SKIP   ',
              onPressed: () {
                Get.to(const HomeLayout());
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
                    Text('Create Account',
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
                    Text('Let’s create account toghter',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: kdefaultTextColor,
                            fontFamily: 'Sora',
                            fontSize: 16)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultText(text: 'Full Name', size: 14),
                    const SizedBox(
                      height: 2,
                    ),
                    defaultFormField(
                        controller: controller.nameController,
                        type: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        label: 'Your name',
                        ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    defaultText(text: 'Email', size: 14),
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
                    defaultText(text: 'Password', size: 14),
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
                    const SizedBox(
                      height: 16.0,
                    ),
                    defaultText(text: 'phone', size: 14),
                    const SizedBox(
                      height: 2,
                    ),
                    defaultFormField(
                      controller: controller.phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your number';
                        }
                        return null;
                      },
                      label: 'phone',
                      
                      
                    ),
                    
                    const SizedBox(
                      height: 20.0,
                    ),
                    GetBuilder<SignupControllerImp>(
                      builder:(controller) =>  defaultButton(
                          onPress: () {
                          if(formKey.currentState!.validate()) {
                            controller.signUP();
                          }
                          },
                          text: 'Sign Up',
                          textColor: Colors.white,
                          size: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultButton(
                      onPress: () {},
                      background: Colors.white,
                      size: 16,
                      text: 'Sign up with google',
                      textColor: kdefaultColor
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                   
                  ]),
            ),
          ),
        ),
      ),
    bottomNavigationBar: BottomAppBar(
      color:  const Color(0xFFF9F9F9),
      elevation: 0.0,
      child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(
                            text: 'Already have an account? ',
                            size: 16,
                            weight: FontWeight.bold,
                            color: Colors.grey
                            ),
                        TextButton(
                            onPressed: () {},
                            child: defaultTextButton(
                              text: 'Log In',
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              fontSize: 16,
                            )),
                      ],
                    ),
    ),
    );
  }
}
