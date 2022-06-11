import 'package:ecommerceapp/utilites/enums.dart';
import 'package:ecommerceapp/utilites/routes.dart';
import 'package:ecommerceapp/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_authType == AuthFormType.login ? "Login" : "Register",
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(
                  height: 88.0,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your email ";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Your Email",
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your password ";
                    } else {
                      return null;
                    }
                  },
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: "Enter Your Password",
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                if (_authType == AuthFormType.login)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text("Forget Your Password?"),
                      onTap: () {},
                    ),
                  ),
                const SizedBox(
                  height: 24.0,
                ),
                MainButtom(
                    text:
                        _authType == AuthFormType.login ? "Login" : "Register",
                    onTap: () {}),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(_authType == AuthFormType.login
                        ? "Don't have an account , Register"
                        : "Have an account , Login"),
                    onTap: () {
                      setState(() {
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _authType == AuthFormType.login
                        ? "Or login with"
                        : "Or RegiAuthpage",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 88,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white),
                      child: Icon(Icons.email),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 88,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white),
                      child: Icon(Icons.email),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
