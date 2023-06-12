import 'package:flutter/material.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/core/shared/components/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text('Notifications'),
    ),
    body: ListView(
    children: [
    Container(
      padding: const EdgeInsets.all(20),
    child: Column(
    children: [
    Row(
    children: [
    Expanded(
      child: Container(
      decoration: const BoxDecoration(
      color: kdefaultColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
      boxShadow: [
                  BoxShadow(
                color: Colors.black54,
                blurRadius: 3,
                offset: Offset(1, 3)
              )
              ],
      ),
      padding: const EdgeInsets.only(top: 12),
      height: 50,
      
      child: defaultText(text: 'News & Update', 
      size: 18,
      color: Colors.white,
      align: TextAlign.center
      ),
      ),
    ),
    Expanded(
      child: Container(
        decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
        boxShadow:  [
                  BoxShadow(
                color: Colors.black54,
                blurRadius: 3,
                offset: Offset(1, 3)
              )
              ],
        ),
        padding: const EdgeInsets.only(top: 12),
      height: 50,
      
      child: defaultText(text: 'Draft', 
      size: 18,
      
      align: TextAlign.center
      ),
      ),
    )
    ],
    ),
    
    ],
    ),
    )
    ],
    ),
    );
  }
}