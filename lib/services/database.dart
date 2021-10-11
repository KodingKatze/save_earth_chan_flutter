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

  Future submit(Disaster disaster) async {
    final request =
        new http.MultipartRequest("POST", Uri.parse(_submitDisaster));
    request.fields['eventTitle'] = disaster.eventTitle;
    request.fields['location'] = disaster.location;
    request.fields['description'] = disaster.description;
    request.fields['longitude'] = disaster.longitude;
    request.fields['latitude'] = disaster.latitude;

    disaster.picture.map((e) async {
      request.files.add(await http.MultipartFile.fromPath("picture", e));
    });
    print(request);
    var response = await request.send();
    if (response.statusCode == 200) {
      print(response.stream);
    } else {
      throw Exception('Failed to load disaster');
    }
  }
}

class Disaster {
  String eventTitle;
  String location;
  String description;
  String latitude;
  String longitude;
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
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        category: json['category']);
  }
}
