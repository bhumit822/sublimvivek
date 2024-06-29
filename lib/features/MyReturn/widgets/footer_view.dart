import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/features/MyReturn/model/return_detail_model.dart';
import 'package:sublime/features/MyReturn/provider/return_detail_provider.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/catch_image_widget.dart';

class FooterView extends StatefulWidget {
  FooterView({super.key, required this.location, required this.time});
  Location? location;
  Widget? time;
  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              "${widget.location?.name}}\n${widget.location!.address}\n${widget.location!.city} ${widget.location!.region} ${widget.location!.postalCode}",
              style: AppTextStyle.semiBold14
                  .copyWith(color: AppColors.newGrayCOlor),
            ),
            widget.time ?? Container(),
          ],
        ),
        Container(
          height: 82.h,
          width: 82.h,
          padding: EdgeInsets.all(5.h),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.dividerColor),
              borderRadius: BorderRadius.circular(100)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: NetworkImageWidget(
              imageUrl: widget.location!.logoUrl ?? "",
              height: 82.spMin,
              width: 82.spMin,
            ),
          ),
        ),
      ],
    );
  }
}
