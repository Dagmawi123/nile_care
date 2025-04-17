import 'package:nile_care/auth/data_provider/auth_data_provider.dart';
import 'package:nile_care/auth/dto/reset_dto.dart';
import 'package:nile_care/auth/dto/verify_dto.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;
  AuthRepository({required this.authDataProvider});
  //request OTP
  Future<void> requestOtp(String email) async {
    try {
      await authDataProvider.requestOtp({"email": email});
    } catch (e) {
      rethrow;
    }
  }

  // Verify OTP
  Future<void> verifyOtp(VerifyDto dto) async {
    try {
      await authDataProvider.verifyOtp(dto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  //reset password
  Future<void> resetPassword(ResetDto dto) async {
    try {
      await authDataProvider.resetPassword(dto.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
