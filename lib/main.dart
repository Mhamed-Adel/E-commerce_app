
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/bindings/initial_binding.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/shared/components/styles.dart';
import 'package:test_app/core/services/services.dart';



void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  
  
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
        title: 'Flutter Demo', 
        debugShowCheckedModeBanner: false,
        theme: ThemeServices.lightTheme,
        darkTheme: ThemeServices.darkTheme,
        themeMode: ThemeServices().getTheme(),
        initialBinding: InitialBindings(),
        getPages: routes,
        );
  }
}


