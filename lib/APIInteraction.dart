import 'dart:io';
import 'dart:convert';

final String baseURL = 'https://api.github.com/users/';

dynamic findUsers(String username) async {
  if(username.trim() == '') return;
  String requestURL = '$baseURL$username';

  var request = await HttpClient().getUrl(Uri.parse(requestURL));
  var response = await request.close();

  String responseContent = '';
  await for(var content in response.transform(Utf8Decoder())) {
    responseContent += content;
  }

  dynamic jsonObject = jsonDecode(responseContent);
  return jsonObject;
}

dynamic getFollowers(String URL) async {
  var request = await HttpClient().getUrl(Uri.parse(URL));
  var response = await request.close();

  String responseContent = '';
  await for(var content in response.transform(Utf8Decoder())) {
    responseContent += content;
  }

  dynamic jsonObject = jsonDecode(responseContent);
  return jsonObject;
}

dynamic getRepos(String URL) async {
  var request = await HttpClient().getUrl(Uri.parse(URL));
  var response = await request.close();

  String responseContent = '';
  await for(var content in response.transform(Utf8Decoder())) {
    responseContent += content;
  }

  dynamic jsonObject = jsonDecode(responseContent);
  return jsonObject;
}