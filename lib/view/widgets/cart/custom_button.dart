import 'package:flutter/material.dart';

import '../../../core/shared/components/constants.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onpressed;
  final IconData icon;
  const CustomMaterialButton({super.key, required this.onpressed, required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                                onPressed: onpressed,
                                elevation: 0.0,
                                color: kdefaultColor,
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                                minWidth: 30,
                                child:  Icon(
                                  icon,
                                  size: 15,
                                  color: Colors.white,
                                ));
  }

  
}