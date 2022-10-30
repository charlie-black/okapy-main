import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:okapy/core/api.dart';
import 'package:okapy/core/locator.dart';
import 'package:okapy/models/auth.dart';
import 'package:okapy/models/user.dart';
import 'package:okapy/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  AuthModel? _authModel;
  AuthModel? get authModel => _authModel;
  Api _api = locator<Api>();
  String? fname;
  String? lname;
  String? phoneNumber;
  String? uemail;
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  bool _busy = false;
  bool get busy => _busy;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Auth() {
    setUpAuth();
  }

  sendOTP() async {
    await _api.getData(endpoint: 'users/api/user/confirm/').then((value) {
      // print(value.data);
    }).catchError((onError) {
      // print(onError);
    });
  }

  Future sendOTPConfirmation({required String otp}) async {
    return await _api.postHeaders(
        url: 'users/api/user/confirm/', data: {'otp': otp}).then((value) {
      print(value.data);
      if (value.statusCode! > 205) {
        return throw false;
      }
      return true;
    }).catchError((onError) {
      print(onError);
      return throw false;
    });
  }

  setUpAuth() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('creds') == null) {
      _isLoggedIn = false;
      notifyListeners();
    } else {
      User user = User.fromJson(jsonDecode(prefs.getString('creds')!));
      _isLoggedIn = true;
      getUser();
      notifyListeners();
    }
  }

  setnames({required String name1, required String name2}) {
    fname = name1;
    lname = name2;
    notifyListeners();
  }

  setPhone({
    required String pNumber,
  }) {
    print(phoneNumber);
    phoneNumber = pNumber;
    notifyListeners();
  }

  Future login({password, email}) async {
    final prefs = await SharedPreferences.getInstance();

    return await _api.postNoHeaders(
      url: 'auth/login/',
      data: {'email_or_phonenumber': email, 'password': password},
    ).then((value) {
      if (value.statusCode == 200) {
        _authModel = AuthModel.fromJson(value.data);
        prefs.setString('token', jsonEncode({'key':_authModel!.key}));
        // _rooms = Room.fromJson(value.data);

        prefs.setString(
            'creds', jsonEncode({'userName': email, 'password': password}));
        return true;
      } else {
        return throw value.data;
      }
    }).catchError((onError) {
      if (onError['non_field_errors'] != null) {
        prefs.setString(
            'creds', jsonEncode({'userName': email, 'password': password}));

        return throw onError['non_field_errors'][0];
      } else {
        return throw onError;
      }
    });
  }

  Future registration(
      {required String password1,
      required String password2,
      required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    uemail = email;
    print({
      "email": email,
      "password1": password1,
      "password2": password2,
      "first_name": fname,
      "last_name": lname,
      "phonenumber": phoneNumber
    });
    notifyListeners();
    return await _api.postNoHeaders(
      url: 'auth/registration/',
      data: {
        "email": email,
        "password1": password1,
        "password2": password2,
        "first_name": fname,
        "last_name": lname,
        "phonenumber": phoneNumber
      },
    ).then((value) {
      if (value.statusCode! > 250) {
        // prefs.setString(
        //     'creds', jsonEncode({'userName': email, 'password': password1}));

        return throw value.data;
      } else {
        _authModel = AuthModel.fromJson(value.data);
        // _rooms = Room.fromJson(value.data);
        prefs.setString(
            'creds', jsonEncode({'userName': email, 'password': password1}));

        prefs.setString('token', jsonEncode({'key': _authModel!.key}));
        return true;
      }
    }).catchError((onError) {
      if (onError['non_field_errors'] != null) {
        return throw onError['non_field_errors'][0];
      } else if (onError['email'] != null) {
        return throw onError['email'][0];
      } else {
        return throw onError;
      }
    });
  }

  getUser() async {
    _busy = true;
    notifyListeners();
    return await _api.getData(endpoint: 'auth/user/').then((value) {
      // print(value.data);
      _userModel = UserModel.fromJson(value.data);
      _busy = false;
      notifyListeners();
    });
  }

  getUserP() async {
    _busy = true;
    notifyListeners();
    return await _api.getData(endpoint: 'auth/user/').then((value) {
      // print(value.data);
      _userModel = UserModel.fromJson(value.data);
      phoneNumber = _userModel?.phonenumber!;
      _busy = false;
      notifyListeners();
    });
  }

  Future updateUser(
      {required String fname,
      required String lname,
      required String pNumber,
      required String email}) async {
    // print();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', jsonEncode({'key': _authModel!.key}));
    uemail = email;
    notifyListeners();
    return await _api.patchToken(
      url: 'auth/user/',
      data: {
        "email": email,
        "first_name": fname,
        "last_name": lname,
        "phonenumber": phoneNumber
      },
    ).then((value) {
      print(value.statusCode);

      print(phoneNumber);
      if (value.statusCode != 200) {
        return false;
      } else {
        _userModel = UserModel.fromJson(value.data);
        // _rooms = Room.fromJson(value.data);
        notifyListeners();
        return true;
      }
    }).catchError((onError) {
      print(onError);
      return throw false;
    });
  }

  Future changePassword({
    required String old_password,
    required String new_password1,
    required String new_password2,
  }) async {
    return await _api.postHeaders(url: 'auth/password/change/', data: {
      "old_password": old_password,
      "new_password1": new_password1,
      "new_password2": new_password2,
    }).then((value) {
      print(value.statusCode);
      if (value.statusCode! > 200) {
        if (value.data['old_password'] != null) {
          return throw value.data['old_password'][0];
        }
        if (value.data['new_password2'] != null) {
          return throw value.data['new_password2'][0];
        }
      }
      return value;
    }).catchError((onError) {
      print(onError);
      return throw onError;
    });
  }

  logout() async {
    _isLoggedIn = false;
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('creds') == null) {
      _isLoggedIn = false;
      notifyListeners();
    } else {
      prefs.remove('creds');
      _isLoggedIn = false;
      getUser();
      notifyListeners();
    }
  }
}
