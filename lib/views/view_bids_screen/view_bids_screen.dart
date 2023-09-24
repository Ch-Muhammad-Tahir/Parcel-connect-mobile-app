import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/models/brief_model.dart';
import 'package:fyp_parcel_connect/utils/media_query.dart';
import 'package:fyp_parcel_connect/widgets/my_custom_text.dart';

import '../brief_screen/brief_screen_widget/brief_tile_view.dart';

class ViewBidsScreenWidget extends StatelessWidget {
  final BriefModel brief;
  const ViewBidsScreenWidget({super.key, required this.brief});
  @override
  Widget build(BuildContext context) {
    var size = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('View Bids'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BriefTileView(
            brief: brief,
            onTab: () {},
          ),
          SizedBox(
            height: size * 0.02,
          ),
          const Divider(
            thickness: 3,
          ),
          SizedBox(
            height: size * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: MyCustomText(
              text: "Traveler Bids",
              fontSize: size * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size * 0.02,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(size * 0.02),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                      ),
                      SizedBox(
                        width: size * 0.02,
                      ),
                      MyCustomText(
                        text: "Mr Dummy",
                        fontSize: size * 0.04,
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Accept'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size * 0.02),
                    child: MyCustomText(
                        fontSize: size * 0.04,
                        text:
                            "xkasdnf akjsd fas dfkja sdm,f asd fkjas mfaksdf ,as dfkasdkf ksad fk asdkf kas dkf dfkj"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
