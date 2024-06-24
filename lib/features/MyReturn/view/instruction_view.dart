import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/chat_textfield_widget.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';

class InstructionView extends StatelessWidget {
  static const routeName = 'InstructionView';
  static const route = '/InstructionView';
  const InstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isBack: true,
        onTap: () {
          context.pop();
        },
        tittle: "Return Details",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 35.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "1",
                    style: AppTextStyle.bold14,
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drop off your return",
                        style: AppTextStyle.bold14,
                      ),
                      Text(
                        "Bring your return items to your selected location. Don’t worry about packing up your items, we’ll do that at the store for you.",
                        style: AppTextStyle.regular14,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 35.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "2",
                    style: AppTextStyle.bold14,
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Show your Mobile Return Code",
                        style: AppTextStyle.bold14,
                      ),
                      Text(
                        "An associate will scan the code above and take care of your return items",
                        style: AppTextStyle.regular14,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
          child: ChatTextFieldWidget(controller: TextEditingController())),
    );
  }
}
