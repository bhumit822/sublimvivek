import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sublime/features/MyReturn/provider/return_detail_provider.dart';
import 'package:sublime/features/MyReturn/view/instruction_view.dart';
import 'package:sublime/features/MyReturn/view/return_lable_view.dart';
import 'package:sublime/features/MyReturn/widgets/brand_widget.dart';
import 'package:sublime/features/MyReturn/widgets/footer_view.dart';
import 'package:sublime/features/MyReturn/widgets/item_return_widget.dart';
import 'package:sublime/features/MyReturn/widgets/qr_widget.dart';
import 'package:sublime/features/MyReturn/widgets/return_item_widget.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/catch_image_widget.dart';
import 'package:sublime/ui_component/widgets/chat_textfield_widget.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';
import 'package:sublime/ui_component/widgets/outLine_button.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';

class MyReturnDetailView extends StatefulWidget {
  static const routeName = 'MyRetuenDetail';
  static const route = '/MyRetuenDetail';
  MyReturnDetailView({super.key, required this.index});
  int? index;

  @override
  State<MyReturnDetailView> createState() => _MyReturnDetailViewState();
}

class _MyReturnDetailViewState extends State<MyReturnDetailView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.index == 0
          ? context.read<ReturnDetailBtIDProvider>().getReturnDetailAPI(
              context, "example-qrcode", "peninsulatrading", "en_US")
          : widget.index == 2
              ? context.read<ReturnDetailBtIDProvider>().getReturnDetailAPI(
                  context, "example-label", "peninsulatrading", "en_US")
              : context.read<ReturnDetailBtIDProvider>().getReturnDetailAPI(
                  context, "example-tracking", "peninsulatrading", "en_US");
    });
  }

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
          child: widget.index == 0
              ? FirstWidget(context)
              : widget.index == 2
                  ? ThirdWidget(context)
                  : SecondWidget(context),
        ),
        bottomNavigationBar:
            ChatTextFieldWidget(controller: TextEditingController()));
  }

  Widget ThirdWidget(BuildContext context) {
    return Consumer<ReturnDetailBtIDProvider>(
      builder: (context, providerValue, child) {
        return Column(
          children: [
            BrandNameWidgetWithImage(
              itemList: providerValue.returnDetailData.data?.items,
              brandName: providerValue.returnDetailData.data?.brand?.name ?? "",
              imagePath:
                  providerValue.returnDetailData.data?.brand?.logoUrl ?? "",
              itemCount: providerValue.returnDetailData.data?.items?.length
                      .toString() ??
                  "0",
            ),
            Container(
              margin: EdgeInsets.all(20.spMin),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 0),
                      blurRadius: 10.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.spMin)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 35.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "On its way back",
                          style: AppTextStyle.bold30,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Estimated Delivery Date",
                          style: AppTextStyle.regular14,
                        ),
                        Text(
                          "Monday",
                          style: AppTextStyle.bold14,
                        ),
                        Text(
                          "JUN",
                          style: AppTextStyle.bold14,
                        ),
                        Text(
                          "23",
                          style:
                              AppTextStyle.bold14.copyWith(fontSize: 80.spMin),
                        ),
                        Row(
                          children: [
                            Text(
                              "LATEST UPDATE",
                              style: AppTextStyle.semiBold14,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Show Full History",
                              style: AppTextStyle.regular14
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "today".toUpperCase(),
                              style: AppTextStyle.bold14,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "09:31am | san francisco, ca".toUpperCase(),
                              style: AppTextStyle.semiBold10.copyWith(
                                color: AppColors.newGrayCOlor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Picked up from Kohl’s",
                          style: AppTextStyle.regular14,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/png/upslogo.png",
                              height: 40.h,
                              width: 40.h,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Tracking Number",
                                    style: AppTextStyle.regular14),
                                Text(
                                  "1zv341710312080787",
                                  style: AppTextStyle.regular14.copyWith(
                                      color: AppColors.newGrayCOlor,
                                      height: 0.8),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ReturnDetailsWidget(
              returnItemList: providerValue.returnDetailData.data?.items ?? [],
              isbill: false,
            ),
          ],
        );
      },
    );
  }

  Widget SecondWidget(BuildContext context) {
    return Consumer<ReturnDetailBtIDProvider>(
        builder: (context, providerValue, child) {
      return providerValue.passwordButtonAction == ButtonAction.loading
          ? SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 1,
                ),
              ),
            )
          : Column(
              children: [
                BrandNameWidgetWithImage(
                  itemList: providerValue.returnDetailData.data?.items,
                  brandName:
                      providerValue.returnDetailData.data?.brand?.name ?? "",
                  imagePath:
                      providerValue.returnDetailData.data?.brand?.logoUrl ?? "",
                  itemCount: providerValue.returnDetailData.data?.items?.length
                          .toString() ??
                      "0",
                ),
                Container(
                  margin: EdgeInsets.all(20.spMin),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 0),
                          blurRadius: 10.0,
                        ),
                      ],
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
                              "Drop off at a ${providerValue.returnDetailData.data?.location?.name ?? ""}",
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
                        margin: EdgeInsets.symmetric(vertical:  10.h, horizontal: 30.h),
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
                                child: SvgPicture.asset(
                                    "assets/icons/svg/document.svg"),
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
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed(RetunLabelView.routeName);
                                },
                                child: Text(
                                  "View Your Return Label",
                                  style: AppTextStyle.bold16
                                      .copyWith(color: AppColors.primaryColor),
                                ),
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
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(InstructionView.routeName);
                          },
                          child: Text(
                            "Read Return Instructions",
                            style: AppTextStyle.regular14
                                .copyWith(color: AppColors.primaryColor),
                          ),
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
                                  "${providerValue.returnDetailData.data?.location?.name ?? ""}\n${providerValue.returnDetailData.data?.location?.address ?? ""}\n${providerValue.returnDetailData.data?.location?.city ?? ""}, ${providerValue.returnDetailData.data?.location?.region ?? ""} ${providerValue.returnDetailData.data?.location?.postalCode ?? ""}",
                                  style: AppTextStyle.semiBold14
                                      .copyWith(color: AppColors.newGrayCOlor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Close",
                                      style: AppTextStyle.bold14.copyWith(
                                          color: AppColors.messageColor),
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
                            Container(
                              height: 92.h,
                              width: 92.h,
                              padding: EdgeInsets.all(5.h),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.dividerColor),
                                  borderRadius: BorderRadius.circular(100)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: NetworkImageWidget(
                                  imageUrl: 
                                  providerValue.returnDetailData.data?.location
                                          ?.logoUrl ??
                                      "",
                                  height: 82.spMin,
                                  width: 82.spMin,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.h),
                        child: PrimaryAppButton(
                            radius: 100,
                            color: AppColors.primaryColor,
                            onTap: () {},
                            buttonName: "Get Directions",
                            isDisabble: false),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
                  child: OutLineButton(
                    buttonName: "I have dropped this off",
                  ),
                ),
                ReturnDetailsWidget(
                  isbill: false,
                  returnItemList:
                      providerValue.returnDetailData.data?.items ?? [],
                ),
              ],
            );
    });
  }

  Widget FirstWidget(BuildContext context) {
    return Consumer<ReturnDetailBtIDProvider>(
      builder: (context, providerValue, child) {
        return providerValue.passwordButtonAction == ButtonAction.loading
            ? SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    strokeWidth: 1,
                  ),
                ),
              )
            : Column(
                children: [
                  BrandNameWidgetWithImage(
                    itemList: providerValue.returnDetailData.data?.items,
                    brandName:
                        providerValue.returnDetailData.data?.brand?.name ?? "",
                    imagePath:
                        providerValue.returnDetailData.data?.brand?.logoUrl ??
                            "",
                    itemCount: providerValue
                            .returnDetailData.data?.items?.length
                            .toString() ??
                        "0",
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20.sp, right: 20.sp, bottom: 20.sp, top: 20.sp),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 0),
                            blurRadius: 10.0,
                          ),
                        ],
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
                                "Drop off at a ${providerValue.returnDetailData.data?.location?.name ?? ""}s",
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
                                          style: AppTextStyle.bold14.copyWith(
                                              color: AppColors.messageColor),
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
                                        horizontal: 10.spMin,
                                        vertical: 5.spMin),
                                    decoration: BoxDecoration(
                                        color: AppColors.LabelButtonColor,
                                        borderRadius:
                                            BorderRadius.circular(10.spMin)),
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
                        providerValue.returnDetailData.data?.qrcodeUrl == null
                            ? SizedBox()
                            : Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      20.spMin, 20.spMin, 20.spMin, 10.spMin),
                                  // height: 3.5.spMin,
                                  width: 295.spMin,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.spMin),
                                      border: Border.all(
                                        color: AppColors.newGrayCOlor,
                                      )),
                                  child: Column(
                                    children: [
                                      NetworkImageWidget(
                                        imageUrl: providerValue
                                            .returnDetailData.data!.qrcodeUrl!,
                                        height: 250.spMin,
                                        width: 250.spMin,
                                      ),
                                      SizedBox(
                                        height: 5.spMin,
                                      ),
                                      Text(
                                        "Expires in 28 Days",
                                        style: AppTextStyle.semiBold12.copyWith(
                                            color: AppColors.newGrayCOlor),
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
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                InstructionView.routeName,
                              );
                            },
                            child: Text(
                              "Read Return Instructions",
                              style: AppTextStyle.semiBold12
                                  .copyWith(color: AppColors.primaryColor),
                            ),
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
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: FooterView(
                            location:
                                providerValue.returnDetailData.data!.location,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.h),
                          child: PrimaryAppButton(
                              radius: 100,
                              color: AppColors.primaryColor,
                              onTap: () {},
                              buttonName: "Get Directions",
                              isDisabble: false),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
                    child: OutLineButton(
                      buttonName: "I have dropped this off",
                    ),
                  ),
                  ItemReturnWidget(
                    returnItemList: providerValue.returnDetailData.data!.items,
                  ),
                ],
              );
      },
    );
  }
}
