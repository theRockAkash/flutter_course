import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

import '../utils/printer.dart';
import 'package:flutter_course/core/constants/app_constants.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class ApiClient extends GetConnect with Printer {
  ApiClient._() {
    onInit();
  }

  static ApiClient? _instance;

  static ApiClient get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ApiClient._();
      return _instance!;
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 30);

    // Add Authorization token to the default headers
    httpClient.addRequestModifier<dynamic>((request) {
      /*  if (AuthService.to.currentUser?.token != null) {
        request.headers['Authorization'] = 'Bearer ${AuthService.to.currentUser?.token}';
      }*/
      if (kDebugMode) {
        printRequest(request);
      }
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      /* if (response.statusCode == 401) {
        AuthService.to.logout();
      }*/
      if (kDebugMode) {
        printResponse(response, request);
      }
      return response;
    });

    super.onInit();
  }

  Future<Response> getCategories() async {
    return await get('/categories');
  }

  Future<Response> getProducts(int offset, int limit) async {
    return await get('/products?offset=$offset&limit=$limit');
  }
}
