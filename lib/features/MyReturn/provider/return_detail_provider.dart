import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
