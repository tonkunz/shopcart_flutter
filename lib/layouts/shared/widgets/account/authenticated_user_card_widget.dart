import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/account_bloc.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountBloc bloc = Provider.of<AccountBloc>(context);

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(bloc.user.image),
                  fit: BoxFit.fill,
                ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4.0,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.all(Radius.circular(200)),
              ),
            ),
            SizedBox(height: 10),
            FlatButton(
              onPressed: bloc.logout(),
              child: Text("Sair"),
            ),
          ],
        ),
      ),
    );
  }
}