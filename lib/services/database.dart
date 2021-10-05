import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

String _getAllDisaster =
    "https://save-earth-chan-server.herokuapp.com/api/disaster";
String _submitDisaster =
    "https://save-earth-chan-server.herokuapp.com/api/disaster";
String _getDisasterById =
    "https://save-earth-chan-server.herokuapp.com/api/disaster/";

class DatabaseHandler {
  Future<Disaster> fetchById(id) async {
    final response = await http.get(Uri.parse(_getDisasterById + id));

    if (response.statusCode == 200) {
      return Disaster.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load disaster');
    }
  }

  Future<List<Disaster>> fetchAll() async {
    final response = await http.get(Uri.parse(_getAllDisaster));

    if (response.statusCode == 200) {
      List res = jsonDecode(response.body);
      List<Disaster> result = [];
      res.map((e) {
        result.add(Disaster.fromJson(e));
      });
      return result;
    } else {
      throw Exception('Failed to load disaster');
    }
  }

  Future submit(eventTitle, description, location, picture) async {
    final response = await http.post(Uri.parse(_getAllDisaster),
        headers: <String, String>{"Content-Type": "application/json; charset=UTF-8"},
        body: jsonEncode(<String, String>{
          'eventTitle' : eventTitle,
          'description' : description,
          'location' : location,
          'picture' : picture
        }));

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return res['task'];
    } else {
      throw Exception('Failed to load disaster');
    }
  }
}

class Disaster {
  String eventTitle;
  String location;
  String description;
  List<String> picture;

  Disaster({
    required this.eventTitle,
    required this.description,
    required this.location,
    required this.picture,
  });

  factory Disaster.fromJson(Map<String, dynamic> json) {
    return Disaster(
        eventTitle: json['title'],
        description: json['desc'],
        location: json['loc'],
        picture: json['pics']);
  }
}
