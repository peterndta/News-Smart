import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reciapp/pages/home_page.dart';
import '../components/copyright.dart';
import '../login_support/auth_service.dart';
import '../login_support/data.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<Data?> submitData(Data _data) async {
  var response = await http.post(
    Uri.parse('https://reciapp.azurewebsites.net/api/authentication/mobile'),
    body: dataToJson(_data),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var data = response.body;
  print(data);

  if (response.statusCode == 200) {
    String responseString = response.body;
    print(responseString);
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

    print(FirebaseAuth.instance.currentUser!.displayName!);
    print(FirebaseAuth.instance.currentUser!.email!);
    print(FirebaseAuth.instance.currentUser!.photoURL!);
  } catch (error) {
    print(error);
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              'short description about the app',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
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
                            MaterialStateProperty.all(Colors.orange)),
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: const Text('Sign in with Google'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}
