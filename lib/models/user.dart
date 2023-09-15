class User {
  String? phonenumber;
  String? password;

  User({
    this.phonenumber,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    phonenumber = json['phonenumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phonenumber'] = phonenumber;
    data['password'] = password;
    return data;
  }
}
