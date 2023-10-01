import 'dart:async';
import 'dart:convert';
import 'package:lebphones/models/api.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class APIConsumer {
  final String apiLink = "http://lebphones.com/api/mobiles/prices";

  // return a parsed JSON from the decoded api using http library
  Future<APIResponse> fetchURL() async {
    final apiResult = await http.get(apiLink);

    if (apiResult.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return APIResponse.fromJson(json.decode(apiResult.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Results');
    }
  }

  // return a parsed JSON from the decoded api using dio library
  Future<APIResponse> apiProvider() async {
    final String _endpoint = apiLink;
    final Dio _dio = Dio();
    try {
      Response response = await _dio.get(_endpoint);
      return APIResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return APIResponse.withError("$error");
    }
  }
}

void main() {
  APIConsumer consumeApi = new APIConsumer();
  consumeApi.apiProvider();
}
