class VerifyDto {
  final String email;
  final String code;

  Map<String, String  > toJson() {
    return {
      'email': email,
      'code': code,
    };
  }

  VerifyDto({required this.email, required this.code});
  factory VerifyDto.fromJson(Map<String, dynamic> json) {
    return VerifyDto(
      email: json['email'],
      code: json['otp']
    );
  }
}
