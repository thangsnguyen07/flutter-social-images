import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagesio/models/author.dart';
import 'package:imagesio/screens/auth/first_open.dart';

// import 'package:imagesio/screens/auth/login.dart';
import 'package:imagesio/screens/auth/verify_email.dart';
import 'package:imagesio/services/auth.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  static const routeName = '/';
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);

    return (firebaseUser != null)
        ? StreamProvider<Author>.value(
            initialData: Author(
                uid: '',
                email: '',
                avatar: '',
                username: '',
                bio: '',
                displayName: ''),
            value: AuthService().currentUser(firebaseUser),
            child: const VerifyEmailPage(),
          )
        : const FirstOpen();
  }
}
