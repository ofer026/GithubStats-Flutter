import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubstats/blocs/users_bloc.dart';
import 'package:provider/provider.dart';
import 'package:githubstats/CustomWidgets/users_view.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController usernameTextController = TextEditingController();

  @override
  void dispose() {
    usernameTextController.dispose();
  }


  Widget getAvatarImage(String avatar_url) {
    if (avatar_url == '') {
      return Container();
    }
    else {
      return Image.network(avatar_url);
    }
  }


  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context);
    //final Users_view users_view = Users_view();
    String username;
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Row(children: <Widget>[
              Image.asset('assets/githubIcon.png',
                width: 70,
                height: 60,),
              Text('Github Stats'),
            ],
            )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            Text(
              'Enter a Github username',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: usernameTextController,
              decoration: InputDecoration(
                  hintText: 'Enter a username',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.6
                      )
                  )
              ),
            ),
            MaterialButton(
              child: Text('press me!'),
              onPressed: () => {
                username = usernameTextController.text.toString(),
                users.findGithubUsers(username),
                //print('users is: ${users.users}')
              },
            ),
            UserListView(),
          ],
        ),
      ),
    );
  }
}
