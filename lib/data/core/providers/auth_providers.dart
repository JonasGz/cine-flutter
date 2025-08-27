import 'package:cinebox/data/repositories/auth_repository_impl.dart';
import 'package:cinebox/data/services/auth/firebase_auth_service.dart';
import 'package:cinebox/domain/usecases/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final authService = ref.watch(firebaseAuthServiceProvider);
  return AuthRepositoryImpl(authService);
});

final signInWithGoogleUseCaseProvider = Provider<SignInWithGoogleUseCase>((
  ref,
) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInWithGoogleUseCase(authRepository);
});

final currentUserProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
