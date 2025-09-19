import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

import '../../../utils/constants.dart';
import '../utils/printer.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class GetConnectApiClient extends GetConnect with Printer {
  GetConnectApiClient._() {
    onInit();
  }

  static GetConnectApiClient? _instance;

  static GetConnectApiClient get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = GetConnectApiClient._();
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
      /*  if (CommonController.to.userData?.token != null) {
        request.headers['Authorization'] = 'Bearer ${CommonController.to.userData?.token}';
      }*/
      if (kDebugMode) {
        printRequest(request);
      }
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      /* if (response.statusCode == 401) {
        CommonController.to.clearData(showLogin: true);
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
