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