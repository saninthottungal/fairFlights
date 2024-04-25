import 'package:firebase_auth/firebase_auth.dart';

class AuthFunctions {
  final FirebaseAuth _autInstance;
  AuthFunctions({required FirebaseAuth autInstance})
      : _autInstance = autInstance;

  //signin
  Future<void> signIn({required String email, required String password}) async {
    await _autInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //signup
  Future<void> signUp({required String email, required String password}) async {
    await _autInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //logout
  Future<void> signOut() async {
    await _autInstance.signOut();
  }

  //resetPassword
  Future<void> resetPassword({required String email}) async {
    await _autInstance.sendPasswordResetEmail(email: email);
  }

  //mailVerification
  Future<void> mailVerification() async {
    if (_autInstance.currentUser != null) {
      await _autInstance.currentUser!.sendEmailVerification();
    }
  }

  //reload
  Future<void> reloadUser() async {
    if (_autInstance.currentUser != null) {
      await _autInstance.currentUser!.reload();
    }
  }
}
