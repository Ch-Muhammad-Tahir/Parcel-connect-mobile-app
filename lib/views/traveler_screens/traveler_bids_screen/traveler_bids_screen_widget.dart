import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/providers/traveler_provider.dart';
import 'package:fyp_parcel_connect/views/brief_screen/brief_screen_widget/brief_tile_view.dart';
import 'package:provider/provider.dart';

import '../../../providers/send_parcel_provide.dart';
import '../../../utils/media_query.dart';

class TravelerBidsScreenWidget extends StatefulWidget {
  const TravelerBidsScreenWidget({super.key});

  @override
  State<TravelerBidsScreenWidget> createState() =>
      _TravelerBidsScreenWidgetState();
}

class _TravelerBidsScreenWidgetState extends State<TravelerBidsScreenWidget> {
  @override
  void initState() {
    Provider.of<TravelerProvider>(context, listen: false).getAllBriefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Bids'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Provider.of<TravelerProvider>(context, listen: true)
                .briefs
                .isEmpty
            ? Center(
                child: Image.asset(
                  "assets/images/bid (1).png",
                  height: GetScreenSize.getScreenWidth(context) * 0.5,
                ),
              )
            : Consumer<TravelerProvider>(builder: (context, provider, child) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BriefTileView(brief: provider.briefs[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: provider.briefs.length);
              }));
  }
}
