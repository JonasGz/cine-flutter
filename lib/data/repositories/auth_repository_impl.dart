import 'package:cinebox/data/services/auth/firebase_auth_service.dart';
import 'package:cinebox/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepositoryImpl(this._firebaseAuthService);

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      return await _firebaseAuthService.signInWithGoogle();
    } catch (e) {
      throw Exception("Firebase initialization error: $e");
    }
  }
}
