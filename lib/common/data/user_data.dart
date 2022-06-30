class UserInfo {
  UserInfo({
    required this.userName,
    required this.userId,
    required this.balance,
  });

  String userName;
  int userId;
  double balance;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userName: json["userName"],
        userId: json["userId"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userId": userId,
        "balance": balance,
      };

  static Map<String, dynamic> child = {
    "userName": '',
    "userId": 0,
    "balance": 0.00,
  };
}
