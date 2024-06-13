import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:sublime/services/models/request_class.dart';
import 'package:sublime/services/models/response_class.dart';
import 'package:sublime/services/network/network.dart';

class ApiRepo {
  static String baseUrl =
      "https://sd39pwiqu0.execute-api.ap-south-1.amazonaws.com/";

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
  static Future<ResponseData<T>> login<T>(
      Map<String, dynamic> credentials) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('auth/login'),
          headers: NetworkDio.getHeaders(),
          body: RequestBody(data: credentials),
        ),
      );

      /// wrap [validateResponse] with toJson methos of model
      // final data = AuthResponse.fromMap(await validateResponse(res));
 final data;
      final response = ResponseData<T>(
          code: res.statusCode,
          // data: data as T,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        // globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
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

 
}
