import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/app/app.dart';
import 'package:sublime/constatnts/strings.dart';
import 'package:sublime/features/auth/model/verify_otp_mdoel.dart';
import 'package:sublime/features/message/model/get_all_thrade_model.dart';
import 'package:sublime/services/models/request_class.dart';
import 'package:sublime/services/models/response_class.dart';
import 'package:sublime/services/network/network.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class ApiRepo {
  static String baseUrl = StringConst.baseUrl;

  // Returns the base URL used for API calls.
  static String getBaseUrl() {
    return baseUrl;
  }

  /// Returns the API URL by concatenating the base URL with the given [url].
  ///
  /// The [url] parameter is the specific endpoint URL for the API call.
  ///
  /// Returns a [String] representing the complete API URL.
  static String getApiUrl(String url) {
    return baseUrl + url;
  }

  /// Returns the API URL with the provided [url] and [id].
  ///
  /// The [url] parameter is the endpoint URL, and the [id] parameter is the ID for the API call.
  ///
  /// Returns a [String] representing the complete API URL with the concatenated [url] and [id].
  static String getApiUrlWithId(String url, String id) {
    return "$baseUrl$url/$id";
  }

  /// Logs in the user and returns a [ResponseData] object containing the response data.
  ///
  /// This function sends a POST request to the login endpoint of the API with the provided credentials.
  /// It expects the response to have a JSON body that can be parsed into the specified generic type [T].
  ///
  /// Returns a [ResponseData] object containing the response code, data, status, and message.
  ///
  /// Throws any exception that occurs during the request or response validation process.
  Future<String> sendOTP(Map<String, dynamic> credentials) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl(StringConst.sendOTP),
          headers: NetworkDio.getHeaders(),
          body: RequestBody(data: credentials),
        ),
      );
      final data = await validateResponse(res);
      final response = ResponseData(
          code: res.statusCode,
          data: data,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        return response.data?["otp_id"] ?? "";
      }
      return "";
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseData<T>> verifyOTP<T>(
      Map<String, dynamic> credentials) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl(StringConst.verifyOTP),
          headers: NetworkDio.getHeaders(),
          body: RequestBody(data: credentials),
        ),
      );

      
      
      final response = ResponseData(
          code: res.statusCode,
          data: VevrifyOtpModel.fromMap(res.data) as T,
          status: res.statusMessage,
          message: 'Success');
      print("check my response data ==> ${response.data}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getChatThreads<T>() async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.get,
          url: getApiUrl(StringConst.getChatThrades),
          headers: NetworkDio.getHeaders(),
        ),
      );
      // final data = await validateResponse(res);
      final response = ResponseData(
          code: res.statusCode,
          data: res.data as T,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        print("check res ==> ${res.data}");
        print("check res ==> ${response.data}");
        return response.data as List<dynamic>;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  /// Uploads a profile picture.
  ///
  /// This function creates a `FormData` object and adds multiple files to it.
  /// The files are added using the `MultipartFile.fromFile` method.
  /// The `FormData` object is then used in a multi-part request to the 'auth/profile-pic' endpoint.
  ///
  /// Returns a `Future` that completes with the response data from the request.
  static Future<ResponseData<T>> uploadImage<T>(
      Uint8List value, String filename) async {
    log("=-=-=--=- > $value");
    log("=-=-=--=- filename> $filename");
    var formData = FormData();
    try {
      formData.files.add(MapEntry(
          'image', MultipartFile.fromBytes(value, filename: filename)));
      var res = await NetworkDio.multiPartRequest(
        request: MultiPartRequest(
          url: getApiUrl('upload/media/image'),
          method: Method.post,
          headers: {
            ...NetworkDio.getHeaders(),
            ...{'Content-Type': 'multipart/form-data'}
          },
          formData: formData,
        ),
      );
      // final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          // data: data as T,

          status: res.statusMessage,
          message: 'Success');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> validateResponse(Response response) async {
    print("Chek response stats => ${response.statusCode}");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
      return response.data;
    } else if (response.statusCode == 400) {
      return response.data;
    } else if (response.statusCode == 401) {
      return response.data;
    } else if (response.statusCode == 404) {
      return response.data;
    } else if (response.statusCode == 500) {
      return response.data;
    } else {
      return response.data;
    }
  }

  SnackBar errorSnackBar(Response<dynamic> response) {
    return SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              response.data['message'],
              style: AppTextStyle.bold16.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
      // Text(
      //   response.data['message'],
      //   style: AppTextStyle.normalRegularBold15.copyWith(color: red),
      // ),
      margin: EdgeInsets.all(15.spMin),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150.r)),
    );
  }

  SnackBar successfulSnackBar(Response<dynamic> response) {
    return SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              response.data['message'],
              style:
                  AppTextStyle.bold16.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(15.w),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150.r)),
    );
  }
}
