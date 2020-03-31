import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/theme_bloc.dart';
import 'package:shopcart_bloc_provider/layouts/android/pages/tabs_page.dart';
import 'blocs/account_bloc.dart';
import 'blocs/cart_bloc.dart';
import 'blocs/home_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<AccountBloc>.value(
          value: AccountBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      // home: TabsPage(),
      home: DefaultTabController(
        length: 3,
        child: TabsPage()
      ),
    );
  }
}