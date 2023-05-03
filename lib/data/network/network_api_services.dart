import 'dart:convert';
import 'dart:io';

import 'package:mvc/data/app_exception.dart';
import 'package:mvc/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
//
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 15),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchException('No Internet Connection');
    }
    return responseJson;
  }

  //
  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(
            const Duration(seconds: 15),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchException('No Internet Connection');
    }
    return responseJson;
  }

  //

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 404:
        throw BadRequestException(response.statusCode.toString());
      default:
        throw FetchException('Error Occured while communicaton with server' +
            'with status code' +
            response.statusCode.toString());
    }
  }
}
