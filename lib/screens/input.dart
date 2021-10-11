import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:save_earth_chan_flutter/customs/judul.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:save_earth_chan_flutter/services/database.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  Disaster disaster = new Disaster(
      eventTitle: "",
      description: "",
      location: "",
      picture: [''],
      latitude: '',
      longitude: '',
      category: ['']);
  late File _image;

  final _formKey = GlobalKey<FormState>();

  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Judul(
            title: "Input",
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      disaster.eventTitle = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Natural Disaster',
                      labelText: 'Event Title',
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF00A1B8))),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      disaster.description = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'A big disaster',
                      labelText: 'Event Descriptions',
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF00A1B8))),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      disaster.location = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Denpasar Bali',
                      labelText: 'Location',
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF00A1B8))),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      disaster.category[0] = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Natural Disaster',
                      labelText: 'Categori',
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF00A1B8))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Position position = await getLocation();
                      setState(() {
                        disaster.longitude = position.longitude.toString();
                        disaster.latitude = position.latitude.toString();
                      });
                    },
                    child: Text("Get Location")),
                ElevatedButton(
                    onPressed: () {
                      getImage();
                    },
                    child: Text("Get Picture from Camera")),
                ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text("Get Picture from Gallery")),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        DatabaseHandler handler = DatabaseHandler();
                        if (_image == null) return;
                        disaster.picture[0] = _image;
                        handler.submit(disaster);
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
