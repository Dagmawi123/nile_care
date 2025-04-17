import 'package:nile_care/auth/data_provider/auth_data_provider.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;
  AuthRepository({required this.authDataProvider});
  //request OTP
  Future<void> requestOtp(String email) async {
    try {
      await authDataProvider.requestOtp({"email":email});
    } catch (e) {
      rethrow;
    }
  }

  // Verify OTP
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    // Implement the logic to verify the OTP for the given phone number
    // This could involve making an API call to your backend service
  }
}
