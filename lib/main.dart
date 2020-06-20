import 'package:flutter/material.dart';
import 'package:githubstats/blocs/users_bloc.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Users>.value(
            value: Users(),
          //notifier: Users()
        )
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }

}

