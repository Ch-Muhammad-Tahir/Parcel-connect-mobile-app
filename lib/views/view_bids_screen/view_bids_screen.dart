import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/models/brief_model.dart';
import 'package:fyp_parcel_connect/providers/send_parcel_provide.dart';
import 'package:fyp_parcel_connect/utils/media_query.dart';
import 'package:fyp_parcel_connect/views/view_bids_screen/widgets/traveler_bid_tile_view.dart';
import 'package:fyp_parcel_connect/widgets/my_custom_text.dart';
import 'package:provider/provider.dart';

import '../brief_screen/brief_screen_widget/brief_tile_view.dart';

class ViewBidsScreenWidget extends StatefulWidget {
  final BriefModel brief;
  const ViewBidsScreenWidget({super.key, required this.brief});

  @override
  State<ViewBidsScreenWidget> createState() => _ViewBidsScreenWidgetState();
}

class _ViewBidsScreenWidgetState extends State<ViewBidsScreenWidget> {
  @override
  void initState() {
    Provider.of<SendParcelProvider>(context, listen: false)
        .getTravelersBid(widget.brief.bid);

    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BriefTileView(
              brief: widget.brief,
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
            Consumer<SendParcelProvider>(
              builder: (context, provider, child) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TravelerBidTileView(
                          bid: provider.travelerBids[index],
                          onTapAccept: () {});
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 1);
                    },
                    itemCount: provider.travelerBids.length);
              },
            )
          ],
        ),
      ),
    );
  }
}
