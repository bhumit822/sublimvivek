import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';
import 'package:social_share/social_share.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:sublime/features/MyReturn/provider/return_detail_provider.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/widgets/custom_app_bar.dart';

class RetunLabelView extends StatefulWidget {
  static const routeName = 'RetunLabelView';
  static const route = '/RetunLabelView';
  const RetunLabelView({super.key});

  @override
  State<RetunLabelView> createState() => _RetunLabelViewState();
}

class _RetunLabelViewState extends State<RetunLabelView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ReturnDetailBtIDProvider>().downloadAndOpenPdf(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReturnDetailBtIDProvider>(
      builder: (context, providerValue, child) {
        return Scaffold(
          appBar: customAppBar(
            isAction: true,
            onActionTap: () async {
             await SocialShare.shareOptions(providerValue.returnDetailData.data?.labelUrl ?? "", );
              //  await Share.share(providerValue.returnDetailData.data?.labelUrl ?? "");
            },
            isBack: true,
            onTap: () {
              context.pop();
            },
            tittle: "Return Details",
          ),
          body: providerValue.pdfController == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    strokeWidth: 1,
                  ),
                )
              : PdfView(
                
                  controller: providerValue.pdfController!,
                  scrollDirection: Axis.vertical),
        );
      },
    );
  }
}
