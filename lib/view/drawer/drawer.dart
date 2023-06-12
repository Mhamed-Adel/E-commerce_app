import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/darwer_controller.dart';
import 'package:test_app/core/routes/app_routes.dart';
import 'package:test_app/view/drawer/profile.dart';
import '../../core/services/services.dart';
import '../../core/shared/components/components.dart';
import '../../core/shared/components/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: kdefaultColor,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/souq.png'),
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<MyDrawerController>(
                init: MyDrawerController(),
                builder:(controller) =>
                ConditionalBuilder(
                  fallback:(context) =>  const LinearProgressIndicator(),
                  condition: controller.model != null,
                  builder:(context) => defaultText(text: '${controller.model!.data!.name}', size: 15, color: Colors.white))),
               
              const SizedBox(
                height: 15,
              ),
              BuildTile(
                icon: Icons.person,
                onTap:(){ Get.to(() => const ProfileScreen()); },
                text: 'Profile',
              ),
              const BuildTile(onTap: null, icon: Icons.notifications, text: 'Notifications'),
              const BuildTile(onTap: null, icon: Icons.language, text: 'Language'),
              const BuildTile(onTap: null, icon: Icons.shopping_bag, text: 'MyOrder'),
              const BuildTile(onTap: null, icon: Icons.payment, text: 'Payment'),
              const BuildTile(onTap: null, icon: Icons.delivery_dining, text: 'Delivery'),
              const BuildTile(onTap: null, icon: Icons.share, text: 'Share'),
              const BuildTile(onTap: null, icon: Icons.feedback, text: 'Feedback'),
              const BuildTile(onTap: null, icon: Icons.help, text: 'Help'),
              BuildTile(onTap: (){
                Get.defaultDialog(
                      onCancel: () {
                        Get.toNamed(AppRoutes.layout);
                      },
                      title: 'Logging Out',
                      content: const Text('Do You want to logout'),
                      onConfirm: () {
                        final MyServices myServices = Get.find();
                        myServices.sharedPreferences
                            .remove('token')
                            .then((value) {
                          Get.offAllNamed(AppRoutes.login);
                        });
                      });
              }, icon: Icons.logout, text: 'Logout'),
              
            //   ListTile(
            //       minLeadingWidth: 10,
            //       contentPadding: EdgeInsets.zero,
            //       leading: const Icon(
            //         Icons.payments_outlined,
            //         color: Colors.white,
            //       ),
            //       title: defaultText(
            //           text: 'Payments', size: 15, color: Colors.white)),
            //   ListTile(
            //       minLeadingWidth: 10,
            //       contentPadding: EdgeInsets.zero,
            //       leading: const Icon(
            //         IconBroken.Location,
            //         color: Colors.white,
            //       ),
            //       title: defaultText(
            //           text: 'Delivery ', size: 15, color: Colors.white)),
            //   ListTile(
            //     minLeadingWidth: 10,
            //     contentPadding: EdgeInsets.zero,
            //     leading: const Icon(
            //       Icons.share_rounded,
            //       color: Colors.white,
            //     ),
            //     title: defaultText(
            //         text: 'Share App ', size: 15, color: Colors.white),
            //   ),
            //   ListTile(
            //     minLeadingWidth: 10,
            //     contentPadding: EdgeInsets.zero,
            //     leading: const Icon(
            //       Icons.feedback_outlined,
            //       color: Colors.white,
            //     ),
            //     title: defaultText(
            //         text: 'Feedback', size: 15, color: Colors.white),
            //   ),
            //   ListTile(
            //     minLeadingWidth: 10,
            //     contentPadding: EdgeInsets.zero,
            //     leading: const Icon(
            //       Icons.help_outline,
            //       color: Colors.white,
            //     ),
            //     title:
            //         defaultText(text: 'Help ', size: 15, color: Colors.white),
            //   ),
            //   ListTile(
            //     minLeadingWidth: 10,
            //     onTap: () {
            //       Get.defaultDialog(
            //           onCancel: () {
            //             Get.toNamed(AppRoutes.layout);
            //           },
            //           title: 'Logging Out',
            //           content: const Text('Do You want to logout'),
            //           onConfirm: () {
            //             final MyServices myServices = Get.find();
            //             myServices.sharedPreferences
            //                 .remove('token')
            //                 .then((value) {
            //               Get.offAllNamed(AppRoutes.login);
            //             });
            //           });
            //     },
            //     contentPadding: EdgeInsets.zero,
            //     leading: const Icon(
            //       IconBroken.Logout,
            //       color: Colors.white,
            //     ),
            //     title: defaultText(
            //         text: 'Log out ', size: 15, color: Colors.white),
            //   ),
            ],
          ),
        )));
  }
}

class BuildTile extends StatelessWidget {
  final dynamic onTap;
  final IconData icon;
  final String text;
  const BuildTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        minLeadingWidth: 10,
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: defaultText(
          text: text,
          size: 15,
          color: Colors.white,
        ));
  }
}
