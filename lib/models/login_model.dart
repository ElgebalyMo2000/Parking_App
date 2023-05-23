class AppLoginModel {
  late String detail;

  AppLoginModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }
}

class UserData {
  String? name;
  String? email;
  String? phone;
  String? vehicleNum;
  String? gender;

  // UserData({
  //
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.token,
  // });

  // named constructor
  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone_number'];
    gender = json['gender'];
    vehicleNum = json['vehicle_number'];
  }
}

class BookingDataModel {
  int? duration;
  int? id;
  String? state;
  String? lotName;
  // String? start_time;
  // int? total_pay;

  BookingDataModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    id = json['id'];
    state = json['state'];
    lotName = json['lot_name'];
    // start_time = json['start_time'];
    // total_pay = json['total_pay'];
  }
}
