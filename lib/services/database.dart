import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class DatabaseHandler {
  String _getAllDisaster =
      "https://save-earth-chan-server.herokuapp.com/api/disaster?q={http}";
  String _submitDisaster =
      "https://save-earth-chan-server.herokuapp.com/api/disaster?q={http}";
  String _getDisasterById =
      "https://save-earth-chan-server.herokuapp.com/api/disaster/";

  Future<Disaster> fetchById(id) async {
    final response = await http.get(Uri.parse(_getDisasterById + id));

    if (response.statusCode == 200) {
      return Disaster.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load disaster');
    }
  }

  Future<List<Disaster>> fetchAll() async {
    var _url = Uri.parse(_getAllDisaster);
    var response = await http.get(_url);

    if (response.statusCode == 200) {
      List res = jsonDecode(response.body) as List;
      List<Disaster> result = [];
      res.forEach((e) {
        result.add(Disaster.fromJson(e));
      });
      return result;
    } else {
      throw Exception('Failed to load disaster');
    }
  }

  Future submit(disaster) async {
    final request =
        new http.MultipartRequest("POST", Uri.parse(_getAllDisaster));
    disaster.forEach((key, value) {
      if (key == "picture") {
        value.map((e) async {
          request.files.add(await http.MultipartFile.fromPath(
            e,
            "png",
          ));
        });
      } else {
        request.fields[key] = value;
      }
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      print("Uploaded");
    } else {
      throw Exception('Failed to load disaster');
    }
  }
}

class Disaster {
  String eventTitle;
  String location;
  String description;
  double latitude;
  double longitude;
  List<dynamic> category;
  List<dynamic> picture;

  Disaster(
      {required this.eventTitle,
      required this.description,
      required this.location,
      required this.picture,
      required this.latitude,
      required this.longitude,
      required this.category});

  factory Disaster.fromJson(Map<String, dynamic> json) {
    return Disaster(
        eventTitle: json['eventTitle'],
        description: json['description'],
        location: json['location'],
        picture: json['picture'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        category: json['category']);
  }
}
