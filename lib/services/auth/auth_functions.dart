import 'package:firebase_auth/firebase_auth.dart';

class AuthFunctions {
  FirebaseAuth autInstance;
  AuthFunctions({required this.autInstance});
  //signin
  Future<void> signIn({required String email, required String password}) async {
    await autInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //signup
  Future<void> signUp({required String email, required String password}) async {
    await autInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //logout
  Future<void> signOut() async {
    await autInstance.signOut();
  }

  //resetPassword
  Future<void> resetPassword({required String email}) async {
    await autInstance.sendPasswordResetEmail(email: email);
  }

  //mailVerification
  Future<void> mailVerification(User user) async {
    await user.sendEmailVerification();
  }
}
