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
}
