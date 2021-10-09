import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_earth_chan_flutter/customs/judul.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String title = '';
  String desc = '';
  String loc = '';

  late File _image;

  final imagePicker = ImagePicker()

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Judul(
            title: "Input",
          ),
        ],
      ),
    );
  }
}
