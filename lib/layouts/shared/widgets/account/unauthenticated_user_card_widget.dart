import 'package:flutter/material.dart';
import 'package:shopcart_bloc_provider/layouts/android/pages/login_page.dart';
import 'package:shopcart_bloc_provider/layouts/android/pages/signup_page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 60),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: Text("Autentique-se"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupPage(),
              ),
            );
          },
          child: Text("Ainda não sou cadastrado"),
        ),
      ],
    );
  }
}
