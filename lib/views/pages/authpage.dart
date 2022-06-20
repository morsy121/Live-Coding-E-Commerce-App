import 'package:ecommerceapp/controllers/authcontroller.dart';
import 'package:ecommerceapp/services/auth.dart';
import 'package:ecommerceapp/utilites/enums.dart';
import 'package:ecommerceapp/utilites/routes.dart';
import 'package:ecommerceapp/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //var _authType = AuthFormType.login;
  final _emailfocusNode = FocusNode();
  final _passwordfocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.sunbmit();
      if (!mounted) return; // to remove warning Which show in terminal
      Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
    } catch (e) {
      // TODO: We will refactor this code into another widget in the next session
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            "Error",
            style: Theme.of(context).textTheme.headline6,
          ),
          content: SizedBox(
            width: 300,
            child: Text(
              e.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          actions: [
            TextButton(
              onPressed: (() => Navigator.of(context).pop()),
              child: Text("Ok"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final auth = Provider.of<AuthBase>(context);

    return Consumer<AuthController>(builder: (_, model, __) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        model.authFormType == AuthFormType.login
                            ? "Login"
                            : "Register",
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(
                      height: 88.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailfocusNode,
                      onChanged: model.updateEmail,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordfocusNode),
                      textInputAction: TextInputAction.next,
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
                      controller: _passwordController,
                      focusNode: _passwordfocusNode,
                      obscureText: true,
                      onChanged: model.updatePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password ";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Your Password",
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    if (model.authFormType == AuthFormType.login)
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
                        text: model.authFormType == AuthFormType.login
                            ? "Login"
                            : "Register",
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            _submit(model);
                            //model.sunbmit();
                            // debugPrint("Email : ${model.email}");
                            // debugPrint(", password : ${model.password}");
                          }
                        }),
                    SizedBox(
                      height: 16.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(model.authFormType == AuthFormType.login
                            ? "Don't have an account , Register"
                            : "Have an account , Login"),
                        onTap: () {
                          _formkey.currentState!.reset();
                          model.toggelFormType();
                          //_formkey.currentState!.reset();
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.17,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        model.authFormType == AuthFormType.login
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
        ),
      );
    });
  }
}
