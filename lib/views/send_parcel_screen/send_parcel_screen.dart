import 'package:flutter/material.dart';
import '../../views/send_parcel_screen/select_parcel_category_screen.dart';
import '../../views/send_parcel_screen/send_parcel_screen_widgets/parcel_size_tile_widget.dart';

import 'package:provider/provider.dart';

import '../../providers/send_parcel_provide.dart';
import '../../utils/app_constant.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/my_custom_text.dart';

class SendParcelScreenWidget extends StatefulWidget {
  const SendParcelScreenWidget({super.key});

  @override
  State<SendParcelScreenWidget> createState() => _SendParcelScreenWidgetState();
}

class _SendParcelScreenWidgetState extends State<SendParcelScreenWidget> {
  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const MyCustomText(text: "Send parcel"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCustomText(
              text: "Parcel Size",
              fontSize: screenSize * 0.06,
              fontWeight: FontWeight.w800,
            ),
            CustomSizedBox(
              height: screenSize * 0.03,
            ),
            Consumer<SendParcelProvider>(builder: (context, provider, child) {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return MyParcelSize(
                        onTab: () {
                          provider.selectParcelSize(
                              AppConstants.parcelSize[index].parcelSize);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectCategoryScreenWidget()));
                        },
                        parcel: AppConstants.parcelSize[index],
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return const CustomSizedBox(
                        height: 10,
                      );
                    },
                    itemCount: AppConstants.parcelSize.length),
              );
            })
          ],
        ),
      ),
    );
  }
}
