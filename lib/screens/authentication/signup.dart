import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/authentication/signupMobile.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/utils/KeyboardUtil.dart';
import 'package:okapy/utils/constants.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _index = 0;
  String? fname;
  String? lname;
  final _formKey = GlobalKey<FormState>();

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

  bool busy = false;
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
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/stack1.png',
                      height: 31,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 39.0),
                    child: Text(
                      'What’s your name ?',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    'Let us know how to properly address you',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: themeColorGrey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                    child: SizedBox(
                      width: 326,
                      child: Text(
                        "First Name",
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
                        onSaved: (newValue) => fname = newValue,
                        validator: (value) {
                          if (value == null) {
                            addError(error: kNamelNullError);
                            return "";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            // border: InputBorder()
                            prefixIcon: Image.asset('assets/userIcon.png')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                    child: SizedBox(
                      width: 326,
                      child: Text(
                        "Last Name",
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
                        onSaved: (newValue) => lname = newValue,
                        validator: (value) {
                          if (value == null) {
                            addError(error: kNamelNullError);
                            return "";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            // border: InputBorder()
                            prefixIcon: Image.asset('assets/userIcon.png')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                      height: 49,
                      width: 326,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                busy = true;
                              });
                              print('validate');
                              _formKey.currentState!.save();
                              KeyboardUtil.hideKeyboard(context);
                              authController.setnames(
                                  name1: fname!, name2: lname!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpMobile()),
                              );
                            }
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
                ],
              ),
            ),
          ),
        ));
  }
}
