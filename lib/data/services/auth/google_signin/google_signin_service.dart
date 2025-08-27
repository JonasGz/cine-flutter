abstract interface class GoogleSignInService {
  Future<String?> signIn();
  Future<void> signOut();
}
