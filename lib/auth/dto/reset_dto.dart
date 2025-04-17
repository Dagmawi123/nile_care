class ResetDto {
  final String email;
  final String password;

  ResetDto({required this.email, required this.password});
  Map<String, String> toJson() {
    return {
      'email': email,
      'newpassword': password,
    };
  }
}
