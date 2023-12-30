
import 'package:flutter/material.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';
import 'package:test_app/core/shared/components/constants.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key, required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScrollIndicator(
          scrollController:
              controller.scrollController,
          width: 50,
          height: 10,
          indicatorWidth: 20,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10),
              color: Colors.grey[300]),
          indicatorDecoration: BoxDecoration(
              color: kdefaultColor,
              borderRadius:
                  BorderRadius.circular(10)),
        ),
      ],
    );
  }
}

