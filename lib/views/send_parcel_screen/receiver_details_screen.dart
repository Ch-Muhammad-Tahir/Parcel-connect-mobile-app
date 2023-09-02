import 'package:bottom_picker/bottom_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../providers/send_parcel_provide.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/my_custom_text.dart';

class ReceiverDetailsScreenWidget extends StatelessWidget {
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String city = "";
  ReceiverDetailsScreenWidget({super.key});
  GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var time;
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Send Package"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          MyCustomText(
              text: "Receiver Details",
              fontWeight: FontWeight.bold,
              fontSize: screenSize * 0.045),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CustomTextField(
              controller: nameController,
              labelText: "Name",
              hintText: "Enter Receiver Name"),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CustomTextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              labelText: "Mobile Number",
              hintText: "Enter Mobile Number"),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CustomTextField(
              controller: addressController,
              minLine: 2,
              labelText: "Address",
              hintText: "Drop Of Address"),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          const MyCustomText(
            text: "Pick Up City/Country",
            fontWeight: FontWeight.w800,
          ),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CSCPicker(
            ///Enable disable state dropdown [OPTIONAL PARAMETER]
            showStates: true,

            /// Enable disable city drop down [OPTIONAL PARAMETER]
            showCities: true,

            ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
            flagState: CountryFlag.DISABLE,

            ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
            dropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1)),

            ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
            disabledDropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey.shade300, width: 1)),

            ///placeholders for dropdown search field
            countrySearchPlaceholder: "Country",
            stateSearchPlaceholder: "State",
            citySearchPlaceholder: "City",

            ///labels for dropdown
            countryDropdownLabel: "*Country",
            stateDropdownLabel: "*State",
            cityDropdownLabel: "*City",

            ///Default Country
            //defaultCountry: CscCountry.India,

            ///Disable country dropdown (Note: use it with default country)
            //disableCountry: true,

            ///Country Filter [OPTIONAL PARAMETER]
            countryFilter: const [
              CscCountry.Pakistan,
            ],

            ///selected item style [OPTIONAL PARAMETER]
            selectedItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///DropdownDialog Heading style [OPTIONAL PARAMETER]
            dropdownHeadingStyle: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

            ///DropdownDialog Item style [OPTIONAL PARAMETER]
            dropdownItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///Dialog box radius [OPTIONAL PARAMETER]
            dropdownDialogRadius: 10.0,

            ///Search bar radius [OPTIONAL PARAMETER]
            searchBarRadius: 10.0,

            ///triggers once country selected in dropdown
            onCountryChanged: (value) {
              ///store value in country variable
              countryValue = value;
            },

            ///triggers once state selected in dropdown
            onStateChanged: (value) {
              ///store value in state variable
              stateValue = value;
            },

            ///triggers once city selected in dropdown
            onCityChanged: (value) {
              cityValue = value;
            },
          ),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CustomTextField(
              controller: messageController,
              minLine: 5,
              labelText: "Message",
              hintText: "Enter Message"),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
          CustomTextButton(
              padding: const EdgeInsets.symmetric(vertical: 13),
              onTab: () {
                String name = nameController.text.trim();
                String phone = phoneController.text.trim();
                String address = addressController.text.trim();
                String message = messageController.text.trim();
                city = "$cityValue ,$stateValue, $countryValue";
                Provider.of<SendParcelProvider>(context, listen: false)
                    .addReceiverDetails(
                        name, phone, address, city, message, context);
              },
              buttonText: "Next",
              buttonColor: Colors.blue,
              radius: 15,
              fontSize: GetScreenSize.getScreenWidth(context) * 0.06),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
        ]),
      ),
    );
  }

  // void onTab(BuildContext context) {
  //   BottomPicker.time(
  //           title: "Set your next meeting time",
  //           titleStyle: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 15,
  //               color: Colors.orange),
  //           onSubmit: (index) {
  //             print(index);
  //           },
  //           onClose: () {
  //             print("Picker closed");
  //           },
  //           use24hFormat: true)
  //       .show(context);
  // }
}
