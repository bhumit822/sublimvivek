import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/MyReturn/widgets/brand_widget.dart';
import 'package:sublime/features/MyReturn/widgets/footer_view.dart';
import 'package:sublime/features/MyReturn/widgets/qr_widget.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/chat_textfield_widget.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';

class MyReturnDetailView extends StatelessWidget {
  static const routeName = 'MyRetuenDetail';
  static const route = '/MyRetuenDetail';
  MyReturnDetailView({super.key, required this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        isBack: true,
        onTap: () {
          context.pop();
        },
        tittle: "Return Details",
      ),
      body: SingleChildScrollView(
        child: index == 0 ? FirstWidget(context) : SecondWidget(context),
      ),
      bottomNavigationBar: index != 0
          ? ChatTextFieldWidget(controller: TextEditingController())
          : SizedBox( ),
    );
  }

  Widget SecondWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const BrandNameWidgetWithImage(),
          Container(
            margin: EdgeInsets.all(20.spMin),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.spMin)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.spMin, vertical: 10.spMin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Drop off at a USPS",
                        style: AppTextStyle.bold24,
                      ),
                      const Text(
                        "Print and Pack",
                        style: AppTextStyle.regular14,
                      ),
                      Row(
                        children: [
                          Text(
                            "Open",
                            style: AppTextStyle.bold14
                                .copyWith(color: AppColors.messageColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Closes 7PM",
                            style: AppTextStyle.regular14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.dividerColor),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child:
                              SvgPicture.asset("assets/icons/svg/document.svg"),
                        ),
                        Text(
                          "Expires in 28 Days",
                          style: AppTextStyle.regular12
                              .copyWith(color: AppColors.newGrayCOlor),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Divider(
                          color: AppColors.dividerColor,
                        ),
                        Text(
                          "View Your Return Lable",
                          style: AppTextStyle.bold16
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Read Return Instructions",
                    style: AppTextStyle.regular14
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: AppColors.dividerColor,
                ),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Drop off Location: ",
                            style: AppTextStyle.bold14,
                          ),
                          Text(
                            "Brundage\n2525 E Brundage Ln\nBakersfield, CA 93307",
                            style: AppTextStyle.semiBold14
                                .copyWith(color: AppColors.newGrayCOlor),
                          ),
                          Row(
                            children: [
                              Text(
                                "Close",
                                style: AppTextStyle.bold14
                                    .copyWith(color: AppColors.messageColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Closes 7PM",
                                style: AppTextStyle.regular14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icons/png/postal_service.png",
                        height: 82.spMin,
                        width: 82.spMin,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                PrimaryAppButton(
                    radius: 100,
                    color: AppColors.primaryColor,
                    onTap: () {},
                    buttonName: "Get Directions",
                    isDisabble: false)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget FirstWidget(BuildContext context) {
    return Column(
      children: [
        const BrandNameWidgetWithImage(),
        Container(
          margin: EdgeInsets.all(20.spMin),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.spMin)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.spMin, vertical: 10.spMin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Drop off at a Kohl’s",
                      style: AppTextStyle.bold24,
                    ),
                    const Text(
                      "No Packing Required",
                      style: AppTextStyle.regular14,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "Open",
                                style: AppTextStyle.bold14
                                    .copyWith(color: AppColors.messageColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Closes 7PM",
                                style: AppTextStyle.regular14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.spMin, vertical: 5.spMin),
                          decoration: BoxDecoration(
                              color: AppColors.lableButtonColor,
                              borderRadius: BorderRadius.circular(10.spMin)),
                          child: Row(
                            children: [
                              Text(
                                "In-store Coupon",
                                style: AppTextStyle.semiBold12,
                              ),
                              SizedBox(
                                width: 5.spMin,
                              ),
                              SvgPicture.asset(
                                  "assets/icons/svg/coupenIcon.svg")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.newGrayCOlor,
              ),
              SizedBox(
                height: 10.spMin,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 10.spMin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BrandLogoNameWidget(
                            isProduct: false,
                            buttonName: "Levi’s",
                            image: "assets/icons/png/leve'sLogo.png",
                            subName: "4 Items",
                          ),
                          SizedBox(
                            height: 10.spMin,
                          ),
                          BrandLogoNameWidget(
                            isProduct: true,
                            buttonName: "501® Original Fit Women's Jeans",
                            image: "assets/icons/png/product_images.png",
                            subName: "26W X 30L",
                          ),
                          SizedBox(
                            height: 10.spMin,
                          ),
                          BrandLogoNameWidget(
                            isProduct: true,
                            buttonName: "501® Original Fit Women's Jeans",
                            image: "assets/icons/png/product_images.png",
                            subName: "26W X 30L",
                          ),
                          SizedBox(
                            height: 10.spMin,
                          ),
                          BrandLogoNameWidget(
                            isProduct: true,
                            buttonName:
                                "724 High Rise Slim Straight Women's Jeans",
                            image: "assets/icons/png/product_images.png",
                            subName: "26W X 30L",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: QRCodeWidget(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.spMin,
              ),
              Divider(
                color: AppColors.newGrayCOlor,
              ),
              SizedBox(
                height: 10.spMin,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 10.spMin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BrandLogoNameWidget(
                            isProduct: false,
                            buttonName: "Carhartt",
                            image: "assets/icons/png/carharrtLogo.png",
                            subName: "2 Items",
                          ),
                          SizedBox(
                            height: 10.spMin,
                          ),
                          BrandLogoNameWidget(
                            isProduct: true,
                            buttonName:
                                "Women’s Re-Engineered Rugged Flex® Loose Fit Canvas Detroit Jacket",
                            image: "assets/icons/png/product_images.png",
                            subName: "L REG",
                          ),
                          SizedBox(
                            height: 10.spMin,
                          ),
                          BrandLogoNameWidget(
                            isProduct: true,
                            buttonName: "Canvas Cap",
                            image: "assets/icons/png/product_images.png",
                            subName: "",
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: QRCodeWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.spMin)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drop off at a Kohl’s",
                      style: AppTextStyle.bold24,
                    ),
                    const Text(
                      "No Packing Required",
                      style: AppTextStyle.regular14,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "Open",
                                style: AppTextStyle.bold14
                                    .copyWith(color: AppColors.messageColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Closes 7PM",
                                style: AppTextStyle.regular14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.spMin, vertical: 5.spMin),
                          decoration: BoxDecoration(
                              color: AppColors.lableButtonColor,
                              borderRadius: BorderRadius.circular(10.spMin)),
                          child: Row(
                            children: [
                              Text(
                                "In-store Coupon",
                                style: AppTextStyle.semiBold12,
                              ),
                              SizedBox(
                                width: 5.spMin,
                              ),
                              SvgPicture.asset(
                                  "assets/icons/svg/coupenIcon.svg")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.spMin,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      20.spMin, 20.spMin, 20.spMin, 10.spMin),
                  // height: 3.5.spMin,
                  width: 295.spMin,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.spMin),
                      border: Border.all(
                        color: AppColors.newGrayCOlor,
                      )),
                  child: Column(
                    children: [
                      Image.asset("assets/icons/png/dummy_qr.png"),
                      SizedBox(
                        height: 5.spMin,
                      ),
                      Text(
                        "Expires in 28 Days",
                        style: AppTextStyle.semiBold12
                            .copyWith(color: AppColors.newGrayCOlor),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.spMin,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Read Return Instructions",
                  style: AppTextStyle.semiBold12
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: 10.spMin,
              ),
              Divider(
                color: AppColors.newGrayCOlor,
              ),
              SizedBox(
                height: 10.spMin,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: 10.h, right: 10.h),
                child: FooterView(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
