import 'package:flutter/material.dart';
import 'package:sublime/features/message/model/get_all_thrade_model.dart';
import 'package:sublime/features/bottom_navigation_bar/provider/bottom_nav_bar_provider.dart';
import 'package:sublime/services/API/repo.dart';

class MessageProvider extends ChangeNotifier {
  // final BottomNavProvider bottomNavProvider;
  // MessageProvider({
  //   required this.bottomNavProvider,
  // });

  ChatThradeModel _chatThradeModel = ChatThradeModel();
  ChatThradeModel get chatThradeModel => _chatThradeModel;

  set chatThradeModel(ChatThradeModel chatThradeModel) {
    _chatThradeModel = chatThradeModel;
    notifyListeners();
  }

  Future<void> getAllChatThreads(BuildContext context) async {
    try {
    

      List<dynamic>  chatThradeResponse =
          await ApiRepo().getChatThreads();

      if (chatThradeResponse != {}) {
        // chatThradeModel = chatThradeModelFromJson(chatThradeResponse as String) as ChatThradeModel;

        print(" check chatThradeModel ==> ${chatThradeModel.toJson()}");
      }
    } catch (e) {
      print("checl verify error ==> $e");
    }
  }
}
