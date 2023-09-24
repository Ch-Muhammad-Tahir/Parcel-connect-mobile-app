import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/models/travelerModel.dart';
import 'package:fyp_parcel_connect/models/traveler_bid.dart';

import '../../../services/firebase_manager.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/my_custom_text.dart';

class TravelerBidTileView extends StatefulWidget {
  final TravelerBid bid;
  final VoidCallback onTapAccept;
  const TravelerBidTileView(
      {super.key, required this.bid, required this.onTapAccept});

  @override
  State<TravelerBidTileView> createState() => _TravelerBidTileViewState();
}

class _TravelerBidTileViewState extends State<TravelerBidTileView> {
  TravelerModel? traveler = TravelerModel();

  void getTravelerModel() async {
    traveler = await FirebaseManager.getTravelerByUID(widget.bid.travelerID);
    setState(() {});
  }

  @override
  void initState() {
    getTravelerModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = GetScreenSize.getScreenWidth(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(size * 0.02),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                  text: traveler!.name,
                  fontSize: size * 0.04,
                ),
                const Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: widget.onTapAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.blue),
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
              child: MyCustomText(fontSize: size * 0.04, text: widget.bid.bid),
            )
          ],
        ),
      ),
    );
  }
}
