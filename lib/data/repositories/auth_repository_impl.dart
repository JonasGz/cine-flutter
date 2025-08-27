import 'package:cinebox/data/services/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepositoryImpl(this._firebaseAuthService);

  Future<User> signInWithGoogle() async {
    try {
      return await _firebaseAuthService.signInWithGoogle();
    } catch (e) {
      throw Exception("Firebase initialization error: $e");
    }
  }
}
