import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:hub_file_flutter/data/app_exceptions.dart';

import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices{

  @override
  Future<dynamic> getApi(String url) async {
    if(kDebugMode){
      print("url $url");
    }
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
      print("response $response");
    }on SocketException {
      throw InternetExceptions('');
    } on TimeoutException{
      throw TimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if(kDebugMode){
      print("url $url");
      print("data $data");
    }
    dynamic responseJson;
      final response;
    try{
      response = await http.post(Uri.parse(url),
      // body: jsonEncode(data),
      body: data,

      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
      print("responsePostApi1122 $responseJson");
    } on SocketException{
      throw InternetExceptions("");
    }
    on RequestTimeOut{
      throw RequestTimeOut("");
    }

    if(kDebugMode){
      print("responseJson000 ${responseJson}");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response httpResponse){
    switch(httpResponse.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(httpResponse.body);
        print("responseJson1 $responseJson");
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(httpResponse.body);
        print("responseJson123 $responseJson");
        return responseJson;
        // throw InvalidUrlException;
      default:
        throw FetchDataException("error occured while communicating with server"+ httpResponse.statusCode.toString());
    }
  }

}
