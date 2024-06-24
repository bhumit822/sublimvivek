import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/features/MyReturn/model/return_detail_model.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class ReturnDetailsWidget extends StatelessWidget {
  ReturnDetailsWidget(
      {super.key, required this.returnItemList, required this.isbill});

  bool? isbill;
  List<Item> returnItemList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${returnItemList.length} Return Items",
              style: AppTextStyle.bold18,
            ),
            SizedBox(
              height: 10.h,
            ),
            for (int i = 0; i < returnItemList.length; i++)
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        returnItemList[i].imageUrl ?? "",
                        height: 125.h,
                        width: 125.h,
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            returnItemList[i].itemName ?? "",
                            style: AppTextStyle.bold14,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Color: ${returnItemList[i].itemColor ?? ""}",
                            style: AppTextStyle.regular14,
                          ),
                          Text(
                            "Size: ${returnItemList[i].itemColor ?? ""}",
                            style: AppTextStyle.regular14,
                          ),
                          Text(
                            "Qty: ${returnItemList[i].returnQuantity ?? ""}",
                            style: AppTextStyle.regular14,
                          ),
                          Text(
                            "\$159.00",
                            style: AppTextStyle.bold14,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Return Reason: ${returnItemList[i].returnReason ?? ""}",
                            style: AppTextStyle.regular14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  i == returnItemList.length - 1 && isbill!
                      ? const SizedBox()
                      : const Divider(
                          color: AppColors.dividerColor,
                        ),
                ],
              ),
            !isbill!
                ? SizedBox()
                : Column(
                    children: [
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Subtotal", style: AppTextStyle.regular14),
                          Text(
                            "\$193.30",
                            style: AppTextStyle.bold14,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Return Method: Drop of at Kohl’s",
                            style: AppTextStyle.regular14,
                          ),
                          Text(
                            "\$0",
                            style: AppTextStyle.bold14,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Estimated Refund*",
                              style: AppTextStyle.regular14),
                          Text(
                            "\$193.30",
                            style: AppTextStyle.bold14,
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
