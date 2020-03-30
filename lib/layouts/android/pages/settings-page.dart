import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/theme_bloc.dart';
import 'package:shopcart_bloc_provider/settings/settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 60),
          Text(
            "Tema atual: ${Settings.theme}",
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Light"),
            onPressed: () {
              bloc.change("light");
            },
          ),
          FlatButton(
            child: Text("Dark"),
            onPressed: () {
              bloc.change("dark");
            },
          ),
          FlatButton(
            child: Text("Dark Yellow"),
            onPressed: () {
              bloc.change("dark-yellow");
            },
          ),
        ],
      ),
    );
  }
}
