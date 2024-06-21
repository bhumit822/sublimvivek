import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/MyReturn/widgets/brand_widget.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/chat_textfield_widget.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';

class MessageDetailView extends StatelessWidget {
  static const routeName = 'messageDetailView';
  static const route = '/messageDetailView';
  const MessageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isBack: true,
        tittle: "Messages",
        onTap: () {
          context.pop();
        },
      ),
      bottomNavigationBar:
          ChatTextFieldWidget(controller: TextEditingController()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/svg/blue_logo.svg"),
                      SizedBox(
                        width: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              "Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum, a 1st-century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin. The first two words themselves are a truncation of dolorem ipsum",
                              style: AppTextStyle.regular16,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.dividerColor),
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: Column(
                                children: [
                                  BrandLogoNameWidget(
                                    buttonName: "Live's",
                                    image: "assets/icons/png/leve'sLogo.png",
                                    isProduct: false,
                                    subName: "3 Items",
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    height: 195.h,
                                    width: 195.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/png/dummy_qr.png"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "3 Return Items",
                                      style: AppTextStyle.bold16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  for (int i = 0; i < 3; i++)
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: BrandLogoNameWidget(
                                        isProduct: true,
                                        buttonName:
                                            "501® Original Fit Women's Jeans",
                                        image:
                                            "assets/icons/png/product_images.png",
                                        subName: "26W X 30L",
                                        imageHeight: 60.h,
                                        imageWidth: 60.h,
                                      ),
                                    ),
                                  const Divider(
                                    color: AppColors.dividerColor,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "See Return Details",
                                      style: AppTextStyle.regular14.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "9:52 AM",
                            style: AppTextStyle.regular12
                                .copyWith(color: AppColors.newGrayCOlor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          ...[
                            Row(
                          
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // ignore: sort_child_properties_last
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.h, vertical: 10),
                                    child: const Text(
                                      "Get Directions to Kohls",
                                      style: AppTextStyle.regular14,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: AppColors.dividerColor)),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  // ignore: sort_child_properties_last
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.h, vertical: 10),
                                    child: const Text(
                                      "Cancel Return",
                                      style: AppTextStyle.regular14,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: AppColors.dividerColor)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // ignore: sort_child_properties_last
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.h, vertical: 10),
                                    child: const Text(
                                      "See Other Locations",
                                      style: AppTextStyle.regular14,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: AppColors.dividerColor)),
                                ),
                              ],
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
