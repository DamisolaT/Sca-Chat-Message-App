class UserModel {
  final String? firstName;
  final String? lastName;
  final String? uid;
  final String? img;

  UserModel({
    this.firstName,
    this.lastName,
    this.uid,
    this.img,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        uid: json["uid"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "uid": uid,
        "img": img,
      };
}
