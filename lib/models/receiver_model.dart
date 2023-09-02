class ReceiverModel {
  String receiverName = "";
  String receiverNumber = "";
  String receiverAddress = "";
  String receiverCity = "";

  String? message = "";
  ReceiverModel();
  ReceiverModel.add(
      {required this.receiverAddress,
      required this.receiverCity,
      required this.receiverName,
      required this.receiverNumber,
      this.message});

  ReceiverModel.fromJson(Map<String, dynamic> json) {
    if (json["receiverName"] is String || json["receiverName"] is int) {
      receiverName = json["receiverName"].toString();
    }
    if (json["receiverNumber"] is String || json["receiverNumber"] is int) {
      receiverNumber = json["receiverNumber"].toString();
    }
    if (json["receiverAddress"] is String || json["receiverAddress"] is int) {
      receiverAddress = json["receiverAddress"].toString();
    }
    if (json["receiverCity"] is String || json["receiverCity"] is int) {
      receiverName = json["receiverCity"].toString();
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "receiverName": receiverName,
      "receiverNumber": receiverNumber,
      "receiverAddress": receiverAddress,
      "receiverCity": receiverCity,
    };
    return result;
  }
}
