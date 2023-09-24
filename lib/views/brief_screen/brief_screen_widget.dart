import 'package:flutter/material.dart';
import '../../providers/send_parcel_provide.dart';
import '../../utils/media_query.dart';
import '../../widgets/my_custom_text.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../view_bids_screen/view_bids_screen.dart';
import 'brief_screen_widget/brief_tile_view.dart';

class BriefScreenWidget extends StatelessWidget {
  const BriefScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Briefs"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Provider.of<SendParcelProvider>(context, listen: true)
                .briefs
                .isEmpty
            ? Center(
                child: Image.asset(
                  "assets/images/bid (1).png",
                  height: GetScreenSize.getScreenWidth(context) * 0.5,
                ),
              )
            : Consumer<SendParcelProvider>(builder: (context, provider, child) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return BriefTileView(
                          onTab: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewBidsScreenWidget(
                                          brief: provider.briefs[index],
                                        )));
                          },
                          brief: provider.briefs[index]);
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
