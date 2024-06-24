import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/features/MyReturn/model/return_detail_model.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class ItemReturnWidget extends StatelessWidget {
  ItemReturnWidget({super.key, required this.returnItemList});
  List<Item>? returnItemList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${returnItemList?.length ?? 0} Return Items",
            style: AppTextStyle.bold18,
          ),
          SizedBox(
            height: 10.h,
          ),
          for (int i = 0; i < returnItemList!.length; i++)
          ReturnItemListWidget(
            itemImage: returnItemList![i].imageUrl,
            itemNmae: returnItemList![i].itemName,
            itemSized: "-",
            itemStyle: "-",
            returnQuantity:  returnItemList![i].returnQuantity.toString(),
            returnReason:  returnItemList![i].returnReason,
          ),
        ],
      ),
    );
  }
}

class ReturnItemListWidget extends StatelessWidget {
  ReturnItemListWidget(
      {super.key,
      required this.itemImage,
      required this.itemNmae,
      required this.itemStyle,
      required this.returnQuantity,
      required this.itemSized,
      required this.returnReason});
  String? itemImage, itemNmae, itemStyle, itemSized ,returnQuantity, returnReason;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            itemImage ?? "",
            height: 100.h,
            width: 100.h,
          ),
          SizedBox(width: 20.h),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 itemNmae!,
                  style: AppTextStyle.bold14,
                ),
                SizedBox(height: 5.h,),
                Text(
                  "Size: ${itemSized!}",
                  style: AppTextStyle.regular14,
                ),
                Text(
                  "Style: ${itemStyle!}",
                  style: AppTextStyle.regular14,
                ),
                Text(
                  "Qty: ${returnQuantity!}",
                  style: AppTextStyle.regular14,
                ),
                SizedBox(height: 10.h,),
            
                Text(
                  "Return Reason: ${returnReason!}",
                  style: AppTextStyle.regular14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
