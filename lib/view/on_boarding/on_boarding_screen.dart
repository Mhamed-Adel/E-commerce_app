import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_app/core/routes/app_routes.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/core/services/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/shared/components/constants.dart';

class OnBoardingModel {
  late final String image;
  late final String text;

  OnBoardingModel({required this.image, required this.text});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var control = PageController();

  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/onboard1.png',
        text:
            'View And Exprience Furniture With The Help Of Augmented Reality '),
    OnBoardingModel(
        image: 'assets/images/onboard2.png',
        text: 'Design Your Space With Augmented Reality By Creating Room'),
    OnBoardingModel(
        image: 'assets/images/onboard3.png',
        text:
            'Explore World Class Top Furnitures As Per Your Requirements & Choice'),
  ];

  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      onSubmit();
                    },
                    child:  Visibility(
                      visible: !isLast,
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          color: kdefaultColor,
                          fontFamily: 'Sora',
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      if (index == boarding.length - 1) {
                        isLast = true;
                      } else {
                        isLast = false;
                      }
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  controller: control,
                  itemCount: boarding.length,
                  itemBuilder: (context, index) =>
                      buildOnBoarding(boarding[index]),
                ),
              ),
              SmoothPageIndicator(
                controller: control,
                count: boarding.length,
                effect: const ExpandingDotsEffect(
                    activeDotColor: kdefaultColor, dotWidth: 15, spacing: 5),
              ),
              const SizedBox(
                height: 14,
              ),

              Visibility(
                visible: !isLast,
                replacement: Row(
                  
                  children: [
                    Expanded(child: defaultButton(onPress: (){
                      onSubmit();
                    }, text: 'Getstarted').animate(

                    ).fadeIn().shimmer(),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
              
                      FloatingActionButton(
                      backgroundColor: kdefaultColor,
                      onPressed: () {
                      if(!isLast ){
                      control.nextPage(duration: const Duration(
                        milliseconds: 500
                      ), curve: Curves.easeInOut);
                      }
                      },
                      child:  const Icon(
              
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 15,
                      )
                     ),
              
                              ],
                ),
              ),
            ],
          ),
        )),
        
            );
  }

  void onSubmit() {
    myServices.sharedPreferences.setBool('onBoarding', true).then((value) {
      if (value) {
        Get.offNamed(AppRoutes.login);
      }
    });
  }

  Widget buildOnBoarding(OnBoardingModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(model.image),
              width: 302,
              height: 305,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 53),
            child: Text(
              model.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 20,
                  color: Color(0xFF264446),
                  fontWeight: FontWeight.w300,
                  height: 1.5),
            ),
          ),
        ],
      );
}
