import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/services/connectivty/check_connectivty.dart';
import 'package:flight_booking/services/exception/auth_exceptions.dart';
import 'package:flight_booking/services/exception/network_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFunctions {
  final FirebaseAuth _autInstance;
  AuthFunctions({required FirebaseAuth autInstance})
      : _autInstance = autInstance;

  //signin
  Future<void> signIn({required String email, required String password}) async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    try {
      await _autInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'user-disabled':
          throw UserDisabledException();
        case 'user-not-found':
          throw UserNotFoundException();
        case 'wrong-password':
          throw WrongPasswordException();
        case 'invalid-credential':
          throw InvalidCredentialsException();
        default:
          throw TooManyRequestsException();
      }
    } catch (_) {
      throw GenericException();
    }
  }

  //signup
  Future<void> signUp({required String email, required String password}) async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    try {
      await _autInstance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        case 'invalid-email':
          throw InvalidEmailException();
        case 'operation-not-allowed':
          throw OperationNotAllowedException();
        case 'weak-password':
          throw WeakPasswordException();
        default:
          throw TooManyRequestsException();
      }
    } catch (_) {
      throw GenericException();
    }
  }

  //logout
  Future<void> signOut() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    try {
      await _autInstance.signOut();
    } catch (_) {
      throw GenericException();
    }
  }

  //resetPassword
  Future<void> resetPassword({required String email}) async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    try {
      await _autInstance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'auth/invalid-email':
          throw InvalidEmailException();
        case 'auth/user-not-found':
          throw UserNotFoundException();
        default:
          throw TooManyRequestsException();
      }
    } catch (_) {
      throw GenericException();
    }
  }

  //mailVerification
  Future<void> mailVerification() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    if (_autInstance.currentUser != null) {
      try {
        await _autInstance.currentUser!.sendEmailVerification();
      } catch (_) {
        throw TooManyRequestsException();
      }
    } else {
      throw UserNotFoundException();
    }
  }

  //reload
  Future<void> reloadUser() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    if (_autInstance.currentUser != null) {
      try {
        await _autInstance.currentUser!.reload();
      } catch (_) {
        throw TooManyRequestsException();
      }
    } else {
      throw UserNotFoundException();
    }
  }
  //google sign in

  Future<void> signInWithGoogle() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) throw NoAccountSelectedException();
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _autInstance.signInWithCredential(credential);
    } on PlatformException {
      throw PlatformSideException();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          throw InvalidCredentialsException();
        case 'operation-not-allowed':
          throw OperationNotAllowedException();
        case 'user-disabled':
          throw UserDisabledException();
        default:
          throw TooManyRequestsException();
      }
    } catch (_) {
      throw GenericException();
    }
  }

  //google signout
  Future<void> signoutFromGoogle() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    try {
      await GoogleSignIn().signOut();
    } catch (_) {
      throw GenericException();
    }
  }
}
