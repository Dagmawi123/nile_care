import 'package:dio/dio.dart';

class AuthDataProvider {
  final Dio dio;
AuthDataProvider({required this.dio});
  Future<void> requestOtp(Map<String, dynamic> body) async {
    try {
      await dio.post(
        "/api/requestOtp",
        data: body,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception("Email is required");
      } else if (e.response?.statusCode == 500) {
        throw Exception("Try again later");
      } else {
        throw Exception("Unexpected error: ${e.message}");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
 
  Future<void> verifyOtp(String phoneNumber, String otp) async { 
  }
}
