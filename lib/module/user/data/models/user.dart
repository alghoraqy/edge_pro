class User {
  final String firstName;
  final String middleName;
  final String lastName;
  final String address;

  User(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.address,
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['firstName'],
        middleName:  json['middleName'],
        lastName:  json['lastName'],
        address:  json['address'],);
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "address": address,
      };
}
