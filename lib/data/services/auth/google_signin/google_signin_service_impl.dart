import 'package:cinebox/data/services/auth/google_signin/google_signin_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninServiceImpl implements GoogleSignInService {
  @override
  Future<String?> signIn() async {
    try {
      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate(
            scopeHint: ['email', 'profile', 'openid'],
          );
      if (account.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return idToken;
      } else {
        throw Exception("ID Token is null");
      }
    } catch (e) {
      throw Exception("Google sign-in error: $e");
    }
  }

  @override
  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
  }
}
