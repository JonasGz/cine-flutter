import 'package:cinebox/data/repositories/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithGoogleUseCase {
  final AuthRepositoryImpl _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  Future<User> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
