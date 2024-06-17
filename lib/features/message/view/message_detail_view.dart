import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/ui_component/widgets/chat_textfield_widget.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';

class MessageDetailView extends StatelessWidget {
  static const routeName = 'messageDetailView';
  static const route = '/messageDetailView';
  const MessageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(isBack: true, tittle: "Messages", onTap: () {
          context.pop();
        },),
      body: 
         SafeArea(
           child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Center(child: Text("Chat Details will be here")),
                ),
              ),
              ChatTextFieldWidget(controller: TextEditingController())
            ],
                   ),
         ),
      
    );
  }
}
