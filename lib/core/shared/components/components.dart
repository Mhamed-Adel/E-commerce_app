
import 'package:flutter/material.dart';
import 'package:test_app/core/shared/components/constants.dart';

Widget defaultButton({
  required onPress,
  required String text,
  double width = double.infinity,
  Color background = kdefaultColor,
  Color textColor = Colors.white,
  double size = 20,
  double borderRadius = 16
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: background,
      ),
      child: MaterialButton(
          onPressed: onPress,
          child: Text(
            text.toUpperCase(),
            style:  TextStyle(
              color: textColor, 
              fontSize: size, 
              fontFamily: 'Sora'),
          )),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        required validate,
        required String label,
        IconData? prefix,
        IconData? suffix,
        onSubmit,
        onChanged,
        bool isPassword = false,
         suffixPress,
        }) =>
    Container(
      // height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
            offset: Offset(1, 4)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextFormField(
          
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: kdefaultColor,
          decoration: InputDecoration(
            border: InputBorder.none ,
            // OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8.0),
      
            // ),

            hintText: label,
            hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.grey
            ),
            // prefixIcon: Icon(prefix),
            // suffixIcon: IconButton(
            //     onPressed:suffixPress,
            //     icon: Icon(suffix),
            //     padding: const EdgeInsets.all(0)),
          ),
          controller: controller,
          keyboardType: type,
          validator: validate,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
          obscureText: isPassword,
        ),
      ),
    );
Widget defaultTextButton ({
  required String text,
  required onPressed,
  required double fontSize,
  FontWeight? weight = FontWeight.w600,
  Color color = kdefaultColor,
  
}) => TextButton(
                onPressed:onPressed,
                child:  Text(
                  text,
                  style:TextStyle(
                  color: color,
                  fontFamily: 'Sora',
                  fontSize: fontSize,
                  fontWeight: weight),
                ));

Widget defaultText({
  required String text,
  required double size,
FontWeight? weight = FontWeight.w600,
Color color = kdefaultColor,
TextAlign? align
})=> Text(text,
textAlign: align,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
  fontFamily: 'Sora',
  
  color: color,
  fontSize: size,
  fontWeight: weight,
  


),);

Widget defaultMaterialButton({
  required onPress,
  required icon,
  required bool? isActive,
  required String text,
})=> MaterialButton(
  padding: const EdgeInsets.only(top: 10),
  onPressed:onPress,
  textColor: isActive==true? kdefaultColor : Colors.grey ,
  shape: const CircleBorder(),
  child: Column(children: [
  Icon(icon,
  color: isActive==true? kdefaultColor : Colors.grey ,
  
  ),
  Text(text,
  style: const TextStyle(
  height: 1.6,
  fontFamily: 'Sora'
  ),
  )
  ],),
  );
