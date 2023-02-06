import 'package:get/get.dart';
import 'package:mgm_client_app/authentication/screens/auth_gate.dart';
import 'screens/login_screen.dart';
import 'screens/otp_verification_screen.dart';

class AuthRoutes {
  AuthRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const AuthGate()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/otpVerification', page: () => OTPVerificationScreen()),
  ];
}
