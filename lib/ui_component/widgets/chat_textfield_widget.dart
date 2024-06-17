import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/textField_widget.dart';

class ChatTextFieldWidget extends StatelessWidget {
  ChatTextFieldWidget({super.key, required this.controller});
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.spMin),
      alignment: Alignment.center,
      height: 64.spMin,
      decoration: BoxDecoration(
      color: Colors.white,

         boxShadow: [new BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10.0,
          ),]
      ),
      child: outlineTextField(
          maxLines: 1,
          controller: controller,
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.spMin),
            child: SvgPicture.asset(
              "assets/icons/svg/star.svg",
            ),
          ),
          hintText: "What can I help you?",
          hintStyle: AppTextStyle.regular16
              .copyWith(color: AppColors.iconunSelectedColor),
          suffixIcon: SizedBox(
            width: 100.spMin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/icons/svg/voice_recording.svg",
                ),
                SizedBox(
                  width: 10.spMin,
                ),
                SvgPicture.asset(
                  "assets/icons/svg/send_up_arrow.svg",
                ),
                SizedBox(
                  width: 15.spMin,
                ),
              ],
            ),
          )),
    );
  }
}
