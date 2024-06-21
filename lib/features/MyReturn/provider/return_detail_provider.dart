import 'package:flutter/material.dart';
import 'package:sublime/features/MyReturn/model/return_detail_model.dart';
import 'package:sublime/services/API/repo.dart';
import 'package:sublime/services/models/response_class.dart';

class ReturnDetailBtIDProvider extends ChangeNotifier {
  Future<void> verifyOTP(BuildContext context) async {
    try {
      primaryFocus?.unfocus();

      final returnItemDetailResponse =
          await ApiRepo().getReturnDetailsByID<ReturnItemDetailByIdModel>("");
      if (returnItemDetailResponse.data!.brand != null) {
      } else {
        // errorMessage = verifyResposne.data?.title ?? "";
        // passwordButtonAction = ButtonAction.error;
      }
      // passwordButtonAction = ButtonAction.none;
    } catch (e) {
      print("checl verify error ==> $e");
      // passwordButtonAction = ButtonAction.none;
    }
  }
}
