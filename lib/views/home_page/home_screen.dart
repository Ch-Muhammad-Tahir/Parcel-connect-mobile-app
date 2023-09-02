import 'package:flutter/material.dart';
import '../../utils/app_constant.dart';
import '../../views/home_page/home_page_widget.dart/sender_receiver_tile.dart';
import '../../views/send_parcel_screen/send_parcel_screen.dart';
import '../../widgets/custom_sized_box.dart';

class HomePageScreenWidget extends StatefulWidget {
  const HomePageScreenWidget({super.key});

  @override
  State<HomePageScreenWidget> createState() => _HomePageScreenWidgetState();
}

class _HomePageScreenWidgetState extends State<HomePageScreenWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome"),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomSizedBox(
            height: screenWith * 0.07,
          ),
          Image.asset(
            "assets/images/courier.png",
            height: screenWith * 0.4,
            // width: 0.4,
            color: Colors.blue,
          ),
          CustomSizedBox(
            height: screenWith * 0.07,
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SenderReceiverTile(
                      image: AppConstants.homePageImages[index],
                      title: AppConstants.homePageItemName[index],
                      subtitle: AppConstants.homePageItemSubtitle[index],
                      color: AppConstants.homePageItemColor[index],
                      onTab: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SendParcelScreenWidget()));
                        }
                      });
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: screenWith * 0.07,
                  );
                },
                itemCount: AppConstants.homePageImages.length),
          ),
        ],
      ),
    );
  }
}
