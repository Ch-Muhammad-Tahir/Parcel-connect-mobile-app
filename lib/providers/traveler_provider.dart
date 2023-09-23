import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/services/firebase_manager.dart';

import '../models/brief_model.dart';

class TravelerProvider extends ChangeNotifier {
  List<BriefModel> briefs = [];

  void getAllBriefs() async {
    briefs = await FirebaseManager.getAllBriefs();
  }

  void postTravelerBid(String bid, String briefId, BuildContext context) {
    FirebaseManager.postTravelerBid(bid, briefId, context);
  }
}
