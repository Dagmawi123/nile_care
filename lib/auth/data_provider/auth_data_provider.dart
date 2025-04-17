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
        final errorMessage = e.response?.data["error"] ?? "";
        if (errorMessage.contains("Email is required")) {
          throw Exception("Email can not be empty");
        } else {
          throw Exception("Email is not registered with us");
        }  
      } else if (e.response?.statusCode == 500) {
        throw Exception("Try again later");
      } else {
        throw Exception("Unexpected error: ${e.message}");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> verifyOtp(Map<String, String> body) async {
    try {
      await dio.post(
        "/api/verifyOtp",
        data: body,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errorMessage = e.response?.data["error"] ?? "";
        if (errorMessage.contains("Email and code are required")) {
          throw Exception("Please fill in all required fields.");
        } else {
          throw Exception("Invalid OTP entered");
        } 
      } else if (e.response?.statusCode == 500) {
        throw Exception("Internal error,try again later");
      } else {
        throw Exception("Unexpected error: ${e.message}");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> resetPassword(Map<String, String> json) async {
    try {
      await dio.post(
        "/api/resetPassword",
        data: json,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Sorry your resetting period has expired");
      } else if (e.response?.statusCode == 400) {
        final errorMessage = e.response?.data["error"] ?? "";
        if (errorMessage.contains("Email and new password are required")) {
          throw Exception("Please fill in all required fields.");
        } else {
          throw Exception("Unable to reset password, please try again");
        }
      } else if (e.response?.statusCode == 500) {
        throw Exception("Internal error, try again later");
      } else {
        throw Exception("Unexpected error: ${e.message}");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
