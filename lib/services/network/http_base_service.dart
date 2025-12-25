import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'base_url.dart';

enum RequestType { aGet, aPost }

class ApiService {
  getResponse(
    String url, {
    Map<String, String>? headedr,
    Map<String, String>? body,
    RequestType requestType = RequestType.aGet,
  }) async {
    headedr = {"Content-Type": "application/json"};
    try {
      if (requestType == RequestType.aGet) {
        debugPrint("--- GET URL --- ${url}");
        final result = await http.get(
          Uri.parse(BaseUrlService.baseUrl + url),
          headers: headedr,
        );
        return returnResponse(result.statusCode, result.body);
      } else if (requestType == RequestType.aPost) {
        debugPrint("--- Post URL --- ${BaseUrlService.baseUrl + url}");
        debugPrint("--- Body --- ${body}");
        final result = await http.post(
          Uri.parse(BaseUrlService.baseUrl + url),
          headers: headedr,
          body: json.encode(body),
        );
        return returnResponse(result.statusCode, result.body);
      }
    } on SocketException catch (e) {
      debugPrint("------ SocketException ---- $e");
    } catch (e) {
      debugPrint("------ api service error---- $e");
      return returnResponse(401, e.toString());
    }
  }

  returnResponse(int status, String response) {
    debugPrint("----- Api response --- $response");
    if (status == 200) {
      return jsonDecode(response);
    } else {
      return jsonDecode(response);
    }
  }
}
