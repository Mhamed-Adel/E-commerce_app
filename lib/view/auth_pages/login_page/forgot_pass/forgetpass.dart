import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/shared/components/components.dart';

import '../../../../controller/auth/forgotpass_controller.dart';
import '../../../../core/shared/components/constants.dart';

class ForgotPassScreen extends StatelessWidget {

  ForgotPassScreen({super.key});
  final  ForgotPassControllerImplemt controller = Get.put(ForgotPassControllerImplemt());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPassControllerImplemt>(
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              defaultText(text: 'Forgot Password', size: 20),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                   controller.isActive = true;
                  controller.changeColor();
                  
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.isActive ? kdefaultColor : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(4, 8),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_rounded,
                          color: controller.isActive? Colors.white : kdefaultColor,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultText(
                              text: 'Email',
                              size: 20,
                              color: controller.isActive? Colors.white : kdefaultColor
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            defaultText(
                                text: 'Send to your Email',
                                size: 15,
                                color: controller.isActive? Colors.white : Colors.grey,
                                weight: FontWeight.w300),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  controller.isActive = false;
                  controller.changeColor();
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.isActive ? Colors.white : kdefaultColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(4, 8),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_rounded,
                          color: !controller.isActive? Colors.white : kdefaultColor,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultText(text: 'Phone', size: 20,
                            color: !controller.isActive? Colors.white : kdefaultColor
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            defaultText(
                                text: 'Send to your Phone number',
                                size: 15,
                                color: !controller.isActive? Colors.white : Colors.grey,
                                weight: FontWeight.w300),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              defaultButton(
                text: 'SEND OTP',
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
