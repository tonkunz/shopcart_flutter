import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/account_bloc.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/account/authenticated_user_card_widget.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/account/unauthenticated_user_card_widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountBloc bloc = Provider.of<AccountBloc>(context);

    return Scaffold(
      body: bloc.user == null
          ? UnauthenticatedUserCard()
          : AuthenticatedUserCard(),
    );
  }
}