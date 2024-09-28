class UserModel {
  final String fullName;
  final String phoneNumber;
  final String emailAddress;
  final String password;
  String? joinedAt;
  String? userId;
  int? birthDay;
  int? birthMonth;
  int? birthYear;
  double? monthlyLimit;

  UserModel({
    this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
    this.joinedAt,
    this.birthDay,
    this.birthMonth,
    this.birthYear,
    this.monthlyLimit,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      fullName: json["fullName"],
      phoneNumber: json["phoneNumber"],
      emailAddress: json["emailAddress"],
      password: json["password"],
      userId: json["uid"],
      joinedAt: json["joinedAt"],
      birthDay: json["birthDay"],
      birthMonth: json["birthMonth"],
      birthYear: json["birthYear"],
      monthlyLimit: json["monthlyLimit"],
    );
  }

  static toJson(UserModel user) {
    return {
      "fullName": user.fullName,
      "phoneNumber": user.phoneNumber,
      "emailAddress": user.emailAddress,
      "password": user.password,
      "uid": user.userId,
      "joinedAt": user.joinedAt,
      "birthDay": user.birthDay,
      "birthMonth": user.birthMonth,
      "birthYear": user.birthYear,
      "monthlyLimit": user.monthlyLimit,
    };
  }
}
