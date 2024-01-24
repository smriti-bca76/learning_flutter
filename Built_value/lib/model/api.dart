import 'dart:async';
import 'dart:convert';

import 'package:myapp/model/built_vehicle.dart';
import 'package:myapp/model/serializers.dart';
import 'package:http/http.dart' as http;

const String url = 'https://jsonplaceholder.typicode.com/users';

Future<List<UserDetail?>> fetchData() async {
  //fetch data is async function that returns list
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> responsedata =
        jsonDecode(response.body); //decode jason data into dart obj

    List<UserDetail?> userDetailList =
        responsedata //list containing dart object
            .map(
              (responsedata) => serializers.deserializeWith(
                  UserDetail.serializer,
                  responsedata), //use serializers to convert dart object into more structured dart object
            )
            .toList();
    //print(userDetailList);
    return userDetailList;
  } else {
    throw Exception('Error: Something went wrong');
  }
}

void main() {
  fetchData();
}
