import 'package:flutter/material.dart';
import 'package:githubstats/APIInteraction.dart';

class Users extends ChangeNotifier {
  Map<String, List<Map>> _users = {'users': []};
  Map<String, List> get users => _users;

  String _avatar_url = '';
  String get avatar_url => _avatar_url;


  findGithubUsers(String username) async {
    print('hello');
    var response = (await findUsers(username));
    print(response);
    print('hey');
    var userName = response['login'];
    print('heyy');
    var followersURL = response['followers_url'];
    var followersCount = (await getFollowers(followersURL)).length;
    var reposURL = response['repos_url'];
    var reposCount = (await getRepos(reposURL)).length;
    //var followersCount = 0;
    //var reposCount = 0;
    print(userName);
    print(avatar_url);
    print(followersCount);
    print(reposCount);
    _avatar_url = response['avatar_url'];
    _users['users'].add({'username': userName, 'avatar_url': avatar_url,
      'followers': followersCount, 'repos': reposCount});
    print(response);
    notifyListeners();
  }

}
