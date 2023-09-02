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
}
