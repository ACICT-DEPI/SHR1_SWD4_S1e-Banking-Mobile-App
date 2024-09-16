class UserModel {
  final String fullName;
  final String phoneNumber;
  final String emailAddress;
  final String password;

  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      fullName: json["fullName"],
      phoneNumber: json["phoneNumber"],
      emailAddress: json["emailAddress"],
      password: json["password"],
    );
  }
}
