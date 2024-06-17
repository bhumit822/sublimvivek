import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sublime/features/message/provider/message_provider.dart';
import 'package:sublime/features/bottom_navigation_bar/provider/bottom_nav_bar_provider.dart';
import 'package:sublime/features/message/view/message_detail_view.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});
  static const routeName = 'message';
  static const route = '/message';

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: Consumer2<BottomNavProvider, MessageProvider>(
        builder: (context, bottomNavProvider, messageProvider, child) {
          return Scaffold(
               appBar: customAppBar(isBack: false, tittle: "Messages"),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.spMin),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < 5; i++)
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(MessageDetailView.routeName);
                          },
                          child: Column(
                            children: [
                              Divider(
                                color: AppColors.iconunSelectedColor
                                    .withOpacity(0.30),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/svg/blue_logo.svg"),
                                      Text(
                                        "Today",
                                        style: AppTextStyle.regular12.copyWith(
                                            color:
                                                AppColors.iconunSelectedColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 05.spMin,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Text(
                                            "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
                                            style: i == 0
                                                ? AppTextStyle.bold16
                                                : AppTextStyle.regular16,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      SizedBox(
                                        width: 10.spMin,
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: 16.spMin,
                                        width: 16.spMin,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.messageColor),
                                      )),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
