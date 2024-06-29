import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:sublime/features/MyReturn/model/return_detail_model.dart';
import 'package:sublime/services/API/repo.dart';
import 'package:sublime/services/models/response_class.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';

class ReturnDetailBtIDProvider extends ChangeNotifier {
  ResponseData<ReturnItemDetailByIdModel> _returnDetailData = ResponseData();

  ResponseData<ReturnItemDetailByIdModel> get returnDetailData =>
      _returnDetailData;

  set returnDetailData(ResponseData<ReturnItemDetailByIdModel> value) {
    _returnDetailData = value;
    notifyListeners();
  }

  ButtonAction _passwordButtonAction = ButtonAction.loading;
  ButtonAction get passwordButtonAction => _passwordButtonAction;
  set passwordButtonAction(ButtonAction action) {
    _passwordButtonAction = action;
    notifyListeners();
  }

  Future<void> getReturnDetailAPI(BuildContext context, String? retunID,
      String? moniker, String? local) async {
    try {
      primaryFocus?.unfocus();
      passwordButtonAction = ButtonAction.loading;

      final returnItemDetailResponse = await ApiRepo()
          .getReturnDetailsByID<ReturnItemDetailByIdModel>(
              "returns/$retunID?retailer_moniker=$moniker&locale=%20$local");
      print(
          "check value of response ==> ${returnItemDetailResponse.data!.brand!.name}");
      if (returnItemDetailResponse.data != null) {
        returnDetailData = returnItemDetailResponse;
        passwordButtonAction = ButtonAction.success;
      } else {
        // errorMessage = verifyResposne.data?.title ?? "";
        passwordButtonAction = ButtonAction.error;
      }
      passwordButtonAction = ButtonAction.none;
    } catch (e) {
      print("checl verify error ==> $e");
      passwordButtonAction = ButtonAction.none;
    }
  }

  PdfController? pdfController;

  Future<void> downloadAndOpenPdf(BuildContext context) async {
    try {
      final dir = await getTemporaryDirectory();

      final filePath = "${dir.path}/temp.pdf";

      final response =
          await Dio().download(returnDetailData.data?.labelUrl ?? "", filePath);

      if (response.statusCode == 200) {
        pdfController = PdfController(
          document: PdfDocument.openFile(filePath),
        );
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download PDF')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}

({String open, String close, String day, bool? closed}) getDate(
  List<Hour> hours,
) {
  if (hours.isEmpty) {
    return (
      open: '',
      close: '',
      day: '',
      closed: true,
    );
  } else {
    final today = DateTime.now();
    final dayName = DateFormat('EEE').format(today);

    final data = hours.firstWhere((element) => element.day == dayName);
    print("chck rea ==> ${data.toMap()}");
    log('${(
      open: gethours(data.open),
      close: gethours(data.close),
      day: dayName,
      closed: data.closed,
    )}');
    return (
      open: gethours(data.open),
      close: gethours(data.close),
      day: dayName,
      closed: data.closed,
    );
  }
}

String gethours(String? hour) {
  try {
    if (hour != null) {
      final hr = int.tryParse(hour.substring(0, 2)) ?? 00;
      final min = int.tryParse(hour.substring(3)) ?? 00;

      final String time =
          '${hr > 12 ? hr - 12 : hr}:${min.toString().padLeft(2, '0')} ${hr > 12 ? 'PM' : 'AM'}';
      log(time);
      return time;
    } else {
      return '00:00';
    }
  } catch (e) {
    log(e.toString());
    return '00:00-';
  }
}
