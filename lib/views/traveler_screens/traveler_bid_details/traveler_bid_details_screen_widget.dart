import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/models/brief_model.dart';
import 'package:fyp_parcel_connect/providers/traveler_provider.dart';
import 'package:fyp_parcel_connect/utils/media_query.dart';
import 'package:provider/provider.dart';

import '../../brief_screen/brief_screen_widget/brief_tile_view.dart';

class TravelerPostBid extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final BriefModel brief;
  TravelerPostBid({super.key, required this.brief});

  @override
  Widget build(BuildContext context) {
    var screenSize = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Parcel Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Column(children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                      ),
                      SizedBox(
                        width: screenSize * 0.02,
                      ),
                      Text(
                        brief.sender!.senderName,
                        style: TextStyle(fontSize: screenSize * 0.04),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize * 0.01,
                  ),
                  Text(
                    brief.itemName,
                    style: TextStyle(fontSize: screenSize * 0.045),
                  ),
                  BriefTileView(
                    brief: brief,
                    showPackageDetails: false,
                    onTab: () {},
                  ),
                  SizedBox(
                    height: screenSize * 0.01,
                  ),
                  const Divider(thickness: 1.5),
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type Your Bid",
                    ),
                    minLines: 3,
                    maxLines: 7,
                  ),
                ]),
              ),
              SizedBox(
                height: screenSize * 0.2,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      String bid = controller.text.trim().toString();
                      print("Brief ID ${brief.bid}");
                      if (bid.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Your Bid is Empty"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Provider.of<TravelerProvider>(context, listen: false)
                            .postTravelerBid(bid, brief.bid, context);
                      }
                    },
                    child: const Text("Post Bid")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
