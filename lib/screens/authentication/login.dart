import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:okapy/screens/authentication/component/formerror.dart';
import 'package:okapy/screens/authentication/forgotPassword/email.dart';
import 'package:okapy/screens/authentication/registrationotp.dart';
import 'package:okapy/screens/authentication/signup.dart';
import 'package:okapy/screens/home/home.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/state/bookings.dart';
import 'package:okapy/utils/KeyboardUtil.dart';
import 'package:okapy/utils/constants.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  bool busy = false;
  bool error = false;

  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, authController, child) => authController.isLoggedIn
          ? Home()
          : Scaffold(
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset('assets/logo.png'),
                        const Text(
                          'Welcome back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          'Please login to continue',
                          style: TextStyle(fontSize: 12, color: themeColorGrey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                          child: SizedBox(
                            width: 326,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: themeColorGrey, fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 326,
                            height: 45,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (newValue) => email = newValue,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kEmailNullError);
                                } else if (emailValidatorRegExp
                                    .hasMatch(value)) {
                                  removeError(error: kInvalidEmailError);
                                }
                                return;
                              },
                              validator: (value) {
                                if (value == null) {
                                  addError(error: kEmailNullError);
                                  return "";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  // border: InputBorder()
                                  prefixIcon: Icon(
                                Icons.email_outlined,
                                color: themeColorGreen,
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                          child: SizedBox(
                            width: 326,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: themeColorGreen, fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 326,
                            height: 45,
                            child: TextFormField(
                              obscureText: true,
                              onSaved: (newValue) => password = newValue,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kPassNullError);
                                } else if (value.length >= 8) {
                                  removeError(error: kShortPassError);
                                }
                                return;
                              },
                              validator: (value) {
                                if (value == null) {
                                  addError(error: kPassNullError);
                                  return "";
                                } else if (value.length < 5) {
                                  return "";
                                }

                                // addError(error: kShortPassError);
                                return null;
                              },
                              decoration: InputDecoration(
                                  // border: InputBorder()
                                  prefixIcon: Icon(
                                Icons.lock_outline,
                                color: themeColorGreen,
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormError(errors: errors),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 30),
                          child: SizedBox(
                            width: 326,
                            height: 45,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                    color: themeColorAmber, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Consumer<Bookings>(
                          builder: (context, bookingsController, child) =>
                              SizedBox(
                                  height: 49,
                                  width: 326,
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  themeColorAmber)),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            busy = true;
                                          });
                                          _formKey.currentState!.save();
                                          KeyboardUtil.hideKeyboard(context);

                                          authController
                                              .login(
                                                  email: email,
                                                  password: password)
                                              .then((value) async {
                                            setState(() {
                                              busy = false;
                                            });
                                            print(value);
                                            await authController.getUser();
                                            bookingsController.getallBookings();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()),
                                            );
                                          }).catchError((error) async {
                                            print(error);

                                            if (error !=
                                                'Please confirm your phonenumber first') {
                                              setState(() {
                                                error = true;

                                                busy = false;
                                              });
                                              addError(
                                                  error: 'An Error Occured');
                                              addError(
                                                  error:
                                                      'Check your username and password');
                                            } else {
                                              setState(() {
                                                busy = false;
                                              });

                                              await authController.getUser();

                                              authController.sendOTP();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RegistrationOTP()),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Please confirm your phonenumber first"),
                                              ));
                                            }
                                          });
                                        }
                                      },
                                      child: busy
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: themeColorGreen,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: themeColorAmber,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            height: 50,
                            width: 326,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: SizedBox(
                                  height: 49,
                                  width: 326,
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Sign in with google',
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Don’t have an account?',
                                    style: TextStyle(
                                      color: Color(0xff1A411D),
                                    ),
                                  ),
                                  Text(
                                    'Create account',
                                    style: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
