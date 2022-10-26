import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/login_support/check_auth.dart';
import '../components/copyright.dart';
import '../login_support/auth_service.dart';
import '../login_support/data.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../login_support/user_preference.dart';
import '../object/user_info.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final getUserInfo = Provider.of<UserInfoProvider>(context, listen: false);
    Future<Data?> submitData(Data _data) async {
      var response = await http.post(
        Uri.parse(
            'https://reciapp.azurewebsites.net/api/authentication/mobile'),
        body: dataToJson(_data),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        String responseString = response.body;

        Map<String, dynamic> decodedToken = JwtDecoder.decode(responseString);
        getUserInfo.userID = int.parse(decodedToken['userId']);
        getUserInfo.name = decodedToken['name'];
        getUserInfo.imageURL = decodedToken['image'];
        getUserInfo.token = json.decode(responseString)['data'];
        getUserInfo.role = decodedToken['role'];
        getUserInfo.mail = decodedToken['email'];

        UserData user = UserData(
            userID: int.parse(decodedToken['userId']),
            name: decodedToken['name'],
            imageURL: decodedToken['image'],
            role: decodedToken['role'],
            mail: decodedToken['email'],
            token: json.decode(responseString)['data']);
        String userString = jsonEncode(user.toJson());
        await UserPreferences.setUserInfo(userString);

        print(getUserInfo.token);
        print(getUserInfo.role);
        print(getUserInfo.mail);
        print(getUserInfo.userID);
        print(getUserInfo.name);
        print(getUserInfo.imageURL);
        print('status ok');
      } else {
        print('status deo ok');
      }
    }

    Future<void> _handleSignIn() async {
      try {
        await AuthService().signInWithGoogle();

        Data data = Data(
          name: FirebaseAuth.instance.currentUser!.displayName!,
          email: FirebaseAuth.instance.currentUser!.email!,
          imageUrl: FirebaseAuth.instance.currentUser!.photoURL!,
        );
        await submitData(data);

        // print(FirebaseAuth.instance.currentUser!.displayName!);
        // print(FirebaseAuth.instance.currentUser!.email!);
        // print(FirebaseAuth.instance.currentUser!.photoURL!);
      } catch (error) {
        print(error);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                height: 120,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              const Text(
                'Best place for sharing and learning recipes',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Gafata', fontSize: 20
                    // fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                'Stаrt the dаy with a better tаste!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Gafata', fontSize: 20, color: Colors.orange
                    // fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _handleSignIn();
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      label: const Text('Sign in with Google'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}
