
class User {
  final String? email;
  final String? userName;
  final String? imgUrl;
  final String? country;
  final String? phoneNumber;

  User({this.email, this.userName, this.country, this.phoneNumber, this.imgUrl});

  factory User.fromJson(Map<String, String> json) {
    return User(
      email: json['email'],
      imgUrl: json['image_url'],
      userName: json['user_name'],
      country: json['country'],
      phoneNumber: json['phone_number'],
    );
  }
}