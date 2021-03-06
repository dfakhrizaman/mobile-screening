class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String avatarUrl;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      avatarUrl: json['avatar'] ?? '',
    );
  }
}
