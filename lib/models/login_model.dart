class AppLoginModel
{

  late String detail;

  AppLoginModel.fromJson(Map<String, dynamic> json)
  {
    detail = json['detail'];
  }
}

class UserData
{

  String? detail;

  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.token,
  // });

  // named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
    detail = json['detail'];
  }
}

class BookingDataModel {
  int? duration;
  int? customerId;
  int? id;
  String? startTime;
  String? state;
  double? totalPay;
  int? slotId;

  BookingDataModel.fromJson(Map<String, dynamic> json){
    duration = json['duration'];
    customerId = json['customer_id'];
    id = json['id'];
    startTime = json['start_time'];
    state = json['state'];
    totalPay = json['total_pay'];
    slotId = json['slot_id'];
  }
}