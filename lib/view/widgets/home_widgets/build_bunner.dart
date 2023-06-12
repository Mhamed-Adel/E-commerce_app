import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';
import '../../../models/home_data_model.dart';

class BuildBunner extends StatelessWidget {
  final BannersData bunner;
   const BuildBunner({super.key, required this.bunner});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        },
        child: Container(
          height: 150,
          margin: const EdgeInsets.only(left: 24),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                imageUrl:bunner.image,
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child:
                    defaultText(text: 'offers', size: 15, color: Colors.white),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: kdefaultColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: defaultTextButton(
                      color: Colors.white,
                      text: 'click here',
                      onPressed: () {},
                      fontSize: 12),
                ),
              )
            ],
          ),
        ),
      );

  }
}