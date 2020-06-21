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
              leading: Image.network(user['avatar_url'], height: 100, width: 70,),
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
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 8.0), // Add margin to the first row of data
                      child: Row(
                        children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0)
                            )
                          ),
                          padding: const EdgeInsets.all(6.0),
                          margin: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Followers: ${user['followers']}',
                            style: TextStyle(
                                fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(6.0)
                              )
                          ),
                          padding: const EdgeInsets.all(6.0),
                          margin: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Repos: ${user['repos']}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                  ),
                    ),
                    Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(6.0)
                              )
                            ),
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.only(right: 2.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Location: ${user['location']}',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ]
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
