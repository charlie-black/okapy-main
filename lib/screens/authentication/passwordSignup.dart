import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:okapy/screens/authentication/registrationComplete.dart';
import 'package:okapy/screens/authentication/signup.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/utils/KeyboardUtil.dart';
import 'package:okapy/utils/constants.dart';
import 'package:provider/provider.dart';

class SignUpPass extends StatefulWidget {
  const SignUpPass({Key? key}) : super(key: key);

  @override
  State<SignUpPass> createState() => _LoginState();
}

class _LoginState extends State<SignUpPass> {
  String? email;
  String? password1;
  String? password2;
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Consumer<Auth>(
          builder: (context, authController, child) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/stepper3.png',
                        height: 31,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 39.0),
                      child: Text(
                        'Let’s get your email address',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()),
                                    );
                                  },
                                  child: Text(
                                    'Sign in with google',
                                    style: TextStyle(
                                        color: themeColorAmber,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                      child: SizedBox(
                        width: 326,
                        child: Text(
                          "Email",
                          style: TextStyle(color: themeColorGrey, fontSize: 12),
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
                            } else if (emailValidatorRegExp.hasMatch(value)) {
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
                          decoration: const InputDecoration(
                              // border: InputBorder()
                              prefixIcon: Icon(Icons.email_outlined)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                      child: SizedBox(
                        width: 326,
                        child: Text(
                          "Password",
                          style: TextStyle(color: themeColorGrey, fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 326,
                        height: 45,
                        child: TextFormField(
                          obscureText: true,
                          onSaved: (newValue) => password1 = newValue,
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
                              prefixIcon: Icon(Icons.lock_outline)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 1),
                      child: SizedBox(
                        width: 326,
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(color: themeColorGrey, fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 326,
                        height: 45,
                        child: TextFormField(
                          obscureText: true,
                          onSaved: (newValue) => password2 = newValue,
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
                              prefixIcon: Icon(Icons.lock_outline)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        height: 49,
                        width: 326,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(themeColorAmber)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  busy = true;
                                });
                                print('validate');
                                _formKey.currentState!.save();
                                KeyboardUtil.hideKeyboard(context);

                                authController
                                    .registration(
                                        email: email!,
                                        password1: password1!,
                                        password2: password2!)
                                    .then((value) {
                                  setState(() {
                                    busy = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationCOmplete()),
                                  );
                                }).catchError((error) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("$error"),
                                  ));
                                  setState(() {
                                    error = true;

                                    busy = false;
                                  });
                                  addError(error: 'An Error Occured');
                                  addError(
                                      error:
                                          'Check your email and password fields!');
                                });
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const RegistrationCOmplete()),
                              // );
                            },
                            child: busy
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      SizedBox(
                                        width: 326 * .7,
                                        child: Center(
                                          child: Text(
                                            'Proceed',
                                            style: TextStyle(
                                                color: Color(0xff1A411D),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Color(0xff1A411D),
                                      )
                                    ],
                                  ))),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
