class UserModel {
  String title;
  String firstName;
  String lastName;
  String gender;
  String country;


  UserModel({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.country,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      title: map["name"]["title"],
      firstName: map["name"]["first"],
      lastName: map["name"]["last"],
      gender: map["gender"],
      country: map["location"]["country"],
    );
  }

}

