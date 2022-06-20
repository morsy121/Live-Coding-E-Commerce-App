import 'package:ecommerceapp/controllers/authcontroller.dart';
import 'package:ecommerceapp/services/auth.dart';
import 'package:ecommerceapp/views/pages/authpage.dart';
import 'package:ecommerceapp/views/pages/bottom_navbar.dart';
import 'package:ecommerceapp/views/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LandingPageRoute extends StatelessWidget {
  const LandingPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChange(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: const Authpage());
            }
            return const BottomNavBar();
          }
          // Factor This Components
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
