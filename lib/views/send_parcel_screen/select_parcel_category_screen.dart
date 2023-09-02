import 'package:flutter/material.dart';
import '../../views/send_parcel_screen/parcel_detail_screen.dart';

import 'package:provider/provider.dart';

import '../../providers/send_parcel_provide.dart';
import '../../utils/app_constant.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_sized_box.dart';

class SelectCategoryScreenWidget extends StatefulWidget {
  const SelectCategoryScreenWidget({super.key});

  @override
  State<SelectCategoryScreenWidget> createState() =>
      _SelectCategoryScreenWidgetState();
}

class _SelectCategoryScreenWidgetState
    extends State<SelectCategoryScreenWidget> {
  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("What are You Sending"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Consumer<SendParcelProvider>(builder: (context, provider, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(AppConstants.categories[index]),
                  leading: AppConstants.icons[index],
                  onTap: () {
                    provider
                        .selectParcelCategory(AppConstants.categories[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParcelDetailScreen()));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return CustomSizedBox(
                  height: screenSize * 0.04,
                );
              },
              itemCount: AppConstants.categories.length);
        }));
  }
}
