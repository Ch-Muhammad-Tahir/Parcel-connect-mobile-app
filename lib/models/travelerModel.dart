class TravelerModel {
  String name = "";
  String email = "";
  String password = "";
  String address = "";
  String phoneNumber = "";
  String cnic = "";
  // String? profileImage = "";
  // String? document = "";
  TravelerModel();
  TravelerModel.add({
    // this.profileImage,
    // this.document,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phoneNumber,
    required this.cnic,
  });

  TravelerModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String || json["name"] is int) {
      name = json["name"].toString();
    }
    if (json["address"] is String || json["address"] is int) {
      address = json["address"].toString();
    }
    if (json["email"] is String || json["email"] is int) {
      email = json["email"].toString();
    }
    if (json["password"] is String || json["password"] is int) {
      password = json["password"].toString();
    }
    if (json["phoneNumber"] is String || json["phoneNumber"] is int) {
      phoneNumber = json["phoneNumber"].toString();
    }
    if (json["cnic"] is String || json["cnic"] is int) {
      cnic = json["cnic"].toString();
    }
    // if (json["profileImage"] is String || json["profileImage"] is int) {
    //   profileImage = json["profileImage"].toString();
    // }
    // if (json["document"] is String || json["document"] is int) {
    //   document = json["document"].toString();
    // }
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "cnic": cnic,
      "phoneNumber": phoneNumber,
      "password": password,
      "email": email,
      "address": address,
    };
  }
}
