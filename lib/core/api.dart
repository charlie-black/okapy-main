import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:okapy/models/auth.dart';
import 'package:okapy/models/user.dart';
import 'package:okapy/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Dio _dio = Dio();

  Future<Response> postNoHeaders({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return _dio.post(serverUrl + url,
        data: data,
        options: Options(
            responseType: ResponseType.json,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  Future<Response> postHeaders({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${user.userName}:${user.password}'))}';
        
    return _dio.post(serverUrl + url,
        data: data,
        options: Options(
            responseType: ResponseType.json,
            headers: <String, String>{
              'authorization': basicAuth,
              'accept': 'application/json'
            },
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  Future<Response> patch({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${user.userName}:${user.password}'))}';

    return _dio.patch(serverUrl + url,
        data: data,
        options: Options(
            responseType: ResponseType.json,
            headers: <String, String>{
              'authorization': basicAuth,
              'accept': 'application/json'
            },
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  Future<Response> patchToken({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    AuthModel user = AuthModel.fromJson(jsonDecode(prefs.getString('token')!));

    return _dio.patch(serverUrl + url,
        data: data,
        options: Options(
            responseType: ResponseType.json,
            headers: <String, String>{
              'Authorization': "Token ${user.key}",
              'accept': 'application/json'
            },
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  Future<Response> postHeadersFormData({
    required String url,
    required data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${user.userName}:${user.password}'))}';

    return _dio.post(serverUrl + url,
        data: data,
        options: Options(
            responseType: ResponseType.json,
            contentType: 'multipart/form-data',
            headers: <String, String>{
              'authorization': basicAuth,
              'accept': 'application/json'
            },
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  Future getData({
    required String endpoint,
    Map<String, dynamic>? param,
  }) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${user.userName}:${user.password}'))}';

    return _dio.get('$serverUrl$endpoint',
        // queryParameters: param,
        options: Options(headers: <String, String>{
          'authorization': basicAuth,
          'accept': 'application/json'
        }));
  }

  Future putData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${user.userName}:${user.password}'))}';

    return _dio.put('$serverUrl$url',
        data: data,
        options: Options(headers: <String, String>{
          'authorization': basicAuth,
          'accept': 'application/json'
        }));
  }

  Future getRawUrl({required String url}) {
    return _dio.get(url);
  }
  // Future getRawUrl({required String url}) {
  //   return _dio.delete(url);
  // }
}
