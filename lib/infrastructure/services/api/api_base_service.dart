import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:halcera/infrastructure/models/dto/error_response.dart';
import 'package:http/http.dart' as http;
import 'api_constant.dart';

enum APIType { get, post, put, delete }

/// contains HTTP templates
class ApiBaseService {
  String base = ApiConstants.baseEndpoint;

  /// Returns Json Response
  Future<dynamic> apiRequest(
      {APIType apiType = APIType.get,
      required String url,
      String? jsonEncodedBodyData,
      bool formPostData = false,
      List<File>? files}) async {
    dynamic responseJson;
    http.Response response;

    try {
      Uri uri = Uri.parse(base + url);
      // set headers
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer ${ApiConstants.accessToken}"
      };
      log("URI request: $uri");
      log("TYPE: $apiType");
      log(ApiConstants.accessToken);

      if (formPostData) {
        headers["content-type"] = "multipart/form-data;";

        var request = http.MultipartRequest(apiType.toString(), uri);
        request.headers.addAll(headers);

        // Add string body parts
        if (jsonEncodedBodyData != null) {
          request.fields.addAll(Map<String, String>.from(
              json.decode(jsonEncodedBodyData.toString())));
        }

        // Add file parts
        if (files != null && files.isNotEmpty) {
          for (var file in files) {
            List<int> _fileData = file.readAsBytesSync();
            request.files.add(http.MultipartFile.fromBytes("avatar", _fileData,
                filename: "useravatar"));
          }
        }

        response = await http.Response.fromStream(await request.send());
      } else {
        headers["content-type"] = "application/json";
        if (APIType.get == apiType) {
          response = await http
              .get(uri, headers: headers)
              .timeout(Duration(seconds: ApiConstants.requestTimeOutDuration));
        } else if (APIType.post == apiType) {
          response = await http
              .post(uri, body: jsonEncodedBodyData, headers: headers)
              .timeout(Duration(seconds: ApiConstants.requestTimeOutDuration));
        } else if (APIType.put == apiType) {
          response = await http
              .put(uri, body: jsonEncodedBodyData, headers: headers)
              .timeout(Duration(seconds: ApiConstants.requestTimeOutDuration));
        } else if (APIType.delete == apiType) {
          response = await http
              .delete(uri, headers: headers)
              .timeout(Duration(seconds: ApiConstants.requestTimeOutDuration));
        } else {
          throw "Invalid Request";
        }
      }
      // parse string to json
      responseJson = _returnResponse(response);
    } on TimeoutException {
      throw "No Internet connection";
    } on SocketException {
      throw "No Internet connection";
    } on HttpException {
      throw "No Service found";
    } on FormatException {
      throw "Invalid data format";
    } catch (e) {
      throw e.toString();
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    int status = response.statusCode;
    late Map<String, dynamic> responseJson;
    if (response.body.isNotEmpty) {
      responseJson =
          Map<String, dynamic>.from(json.decode(response.body.toString()));

      // int? responseStatus = responseJson['status'];
      // if (responseStatus != null) {
      //   status = responseStatus;
      // }
      log(responseJson.toString());
    }
    switch (status) {
      case 204:
        return;
      case 200:
      case 201:
      case 202:
      case 203:
      case 205:
      case 206:
      case 207:
      case 208:
      case 225:
        return responseJson;
      case 400:
      case 401:
      case 404:
      case 403:
      case 406:
      case 422:
      case 500:
        if (response.body.isEmpty) {
          throw "An error occured";
        }

        ErrorResponse error = ErrorResponse.fromJson(responseJson);
        if (error.error?.fields != null) {
          if (error.error?.fields?.errorDetails != null) {
            throw error.error?.fields?.errorDetails?.first ??
                'An error occured';
          }
        }
        String errorMessage = error.message ??
            ('${error.error?.message ?? ''} ${error.error?.code ?? ''}');
        log(errorMessage);
        throw errorMessage;

      default:
        throw "An error occured";
    }
  }
}
