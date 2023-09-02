class SenderModel {
  String senderName = "";
  String senderNumber = "";
  String senderAddress = "";
  String senderCity = "";
  String pickUpDate = "";
  String? message = "";
  SenderModel();
  SenderModel.add(
      {required this.senderName,
      required this.senderNumber,
      required this.senderAddress,
      required this.senderCity,
      required this.pickUpDate,
      this.message});

  SenderModel.fromJson(Map<String, dynamic> json) {
    if (json["senderName"] is String || json["senderName"] is int) {
      senderName = json["senderName"].toString();
    }
    if (json["senderNumber"] is String || json["senderNumber"] is int) {
      senderNumber = json["senderNumber"].toString();
    }
    if (json["senderAddress"] is String || json["senderAddress"] is int) {
      senderAddress = json["senderAddress"].toString();
    }
    if (json["senderCity"] is String || json["senderCity"] is int) {
      senderCity = json["senderCity"].toString();
    }
    if (json["pickUpDate"] is String || json["pickUpDate"] is int) {
      pickUpDate = json["pickUpDate"].toString();
    }
    if (json["message"] is String || json["message"] is int) {
      message = json["message"].toString();
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "senderName": senderName,
      "senderNumber": senderNumber,
      "senderAddress": senderAddress,
      "senderCity": senderCity,
      "pickUpDate": pickUpDate,
      "message": message,
    };
    return result;
  }
}
