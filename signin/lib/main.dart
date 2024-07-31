import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'controllers/data_helper.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInDemo(),
    );
  }
}

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  final GoogleSignIn _googleSingIn = GoogleSignIn();
  final DataHelper _dataHelper = DataHelper();

  UserModel? _user;

  //Metodo para iniciar sesion con google
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSingIn.signIn();
      if (googleUser != null) {
        _user = UserModel(
          id:googleUser.id,
          name:googleUser.displayName ??"",
          email:googleUser.email,
          photoUrl:googleUser.photoUrl ??"",
        );
        await _dataHelper.insertUser(_user!);
        setState((){});
      }
    } catch (error) {
      print(error);
    }
  }

  //Metodo para iniciar sesion con Facebook
  Future<void> _signInWithFacebook() async {
  final LoginResult result = await FacebookAuth.instance.login();
  if (result.status == LoginStatus.success) {
    final userData = await FacebookAuth.instance.getUserData();
    _user = UserModel (
      id:userData['id'],
      name:userData['name']??"",
      email:userData['email']??"",
      photoUrl:userData['picture']['data']['url']??"",
    );
    await _dataHelper.insertUser(_user!);
    setState((){});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Login with Social Networks"),
    ),
    body: Center(
      child: _user == null
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: _signInWithFacebook,
              child: Text('Sign in with Facebook'),
            ),
          ],
        )
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(_user!.photoUrl),
            radius: 40,
          ),
          Text("Welcome, ${_user!.name}"),
          Text(_user!.email),
          ElevatedButton(
            onPressed: () {
              setState(() {
              _user = null;
              });
            },
            child: Text('Sign Out'),
          ),
        ],
      ),
    ),
  );
}
}

