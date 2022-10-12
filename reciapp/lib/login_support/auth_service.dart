import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reciapp/pages/home_page.dart';
import 'package:reciapp/pages/login_page.dart';

class AuthService {
  //1. handleAuthState()
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        });
  }

  //2. signInWithGoogle()
  signInWithGoogle() async {
    //trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn(); //google sign in

    //obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //once signed in, return the user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //3. signOut()
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
