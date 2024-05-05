class RegisterResponse {
  final String email;
  final String uuid;

  RegisterResponse({
    required this.email,
    required this.uuid,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        email: json["email"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "uuid": uuid,
      };
}
