import 'package:ecommerceapp/services/auth.dart';
import 'package:ecommerceapp/utilites/router.dart';
import 'package:ecommerceapp/utilites/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Commerce App",
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFE5E5E5),
          primaryColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.grey)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
