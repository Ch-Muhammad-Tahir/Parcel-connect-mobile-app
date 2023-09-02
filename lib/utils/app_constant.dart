import 'package:flutter/material.dart';
import '../../models/parcel_size_model.dart';
import '../../utils/app_assets.dart';
import 'package:line_icons/line_icon.dart';

class AppConstants {
  static List<String> title = [
    "Send Parcel",
    "Track Parcel !!",
    "Share happiness"
  ];
  static List<String> discriptions = [
    "Your Journey, Our Delivery: Connecting Travelers and Parcels.",
    "Track You order, Any Time.",
    "Sharing Journeys, Delivering Parcels: Connect. Carry. Deliver.",
  ];
  static List<String> onboardingTopShapes = [
    AppAssets.shape1,
    AppAssets.shape2,
    AppAssets.shape3,
  ];
  static List<String> onboardCenterTopShapes = [
    AppAssets.getOrderIcon,
    AppAssets.trackIcon,
    AppAssets.getOrderIcon,
  ];
  static List<String> homePageImages = [
    "assets/images/parcel.png",
    "assets/images/parcel (1).png"
  ];
  static List<String> homePageItemName = ["Send Package", "I'm Recipient "];
  static List<String> homePageItemSubtitle = [
    "Send or Received Item Such as Cake, Documents,keys",
    "Receive Packages or Gifts From Your Favorites  "
  ];
  static List<Color> homePageItemColor = [Colors.blue, Colors.black];
  static List<ParcelSize> parcelSize = [
    ParcelSize(
      parcelSize: 'Small',
      parcelSizeDimension: 'Max. 25 kg, 8 x 38 x 64 cm',
      parcelSizeDescription: 'Fits in an envelope',
      parcelSizeImage: 'assets/images/img_parcel_size_small.png',
    ),
    ParcelSize(
      parcelSize: 'Medium',
      parcelSizeDimension: 'Max. 25 kg, 19 x 38 x 64 cm',
      parcelSizeDescription: 'Fits in a shoe box',
      parcelSizeImage: 'assets/images/img_parcel_size_medium.png',
    ),
    ParcelSize(
      parcelSize: 'Large',
      parcelSizeDimension: 'Max. 25 kg, 41 x 38 x 64 cm',
      parcelSizeDescription: 'Fits in a cardboard box',
      parcelSizeImage: 'assets/images/img_parcel_size_large.png',
    ),
    ParcelSize(
      parcelSize: 'Custom',
      parcelSizeDimension: 'Max: 30kg or 300cm',
      parcelSizeDescription: 'Fits on a skid',
      parcelSizeImage: 'assets/images/img_parcel_size_custom.png',
    ),
  ];

  static List<String> categories = [
    "Documents",
    "Food or Meals",
    "Clothes",
    "Luggage",
    "Legal Documents",
    "Cake",
    "Auto Parts",
    "Printed Materials",
    "Retail Items",
    "Electronics and Gadgets",
    "Bulk Mail",
    "Marketing Materials",
    "Retail Returns",
  ];

  static final List icons = [
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.food_bank_outlined,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.luggage,
    ),
    const Icon(
      Icons.document_scanner_outlined,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
    const Icon(
      Icons.edit_document,
    ),
  ];
}
