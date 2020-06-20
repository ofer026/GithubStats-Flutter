import 'package:flutter/material.dart';
import 'package:githubstats/blocs/users_bloc.dart';
import 'package:provider/provider.dart';


class UserListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context);
    return Expanded(
      child: ListView(
          children: [for (var user in users.users['users']) Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0,
                    color: Colors.black
                )
            ),
            child: ListTile(
              leading: Image.network(user['avatar_url'], height: 60, width: 60,),
              title: Text(
                '${user['username']}',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Container(
                //color: Colors.green,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0)
                  )
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Followers: ${user['followers']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Repos: ${user['repos']}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )]
      ),
    );
  }
}
