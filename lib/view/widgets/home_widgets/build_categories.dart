import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/components/components.dart';
import '../../../models/cat_model.dart';

class BuildCategories extends StatelessWidget {
final  CatData catModel;
final int index;

  const BuildCategories({super.key, required this.catModel , required this.index,});
 final int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return  Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {},
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
              margin: const EdgeInsets.only(
                left: 20,
                top: 5,
              ),
              decoration: BoxDecoration(
                  color:   Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(1, 4))
                  ]),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:'${catModel.data![index].image}',
                    width: 20,
                    height: 20,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error,size: 15,)),
                  ),
                  // Image(image: CachedNetworkImageProvider('${catModel.image}',),width: 20,height: 20),
                  const SizedBox(
                    width: 5,
                  ),
                  defaultText(
                      text: '${catModel.data![index].name}',
                      size: 13,
                      color: Colors.grey,
                      weight: FontWeight.w600)
                ],
              )),
        ),
      );

  }
}