import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class NearYou extends StatefulWidget {
  const NearYou({Key? key}) : super(key: key);

  @override
  _NearYouState createState() => _NearYouState();
}

class _NearYouState extends State<NearYou> {
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
    return FutureBuilder(
        future: getLocation(),
        builder: (context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.hasData) {
            return FlutterMap(
              options: MapOptions(
                center:
                    LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/deedima3/ckubx7hri034c17qn0vm868ig/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGVlZGltYTMiLCJhIjoiY2t1Ynd2NzRwMHY0ODJubzNtbXBqcTE5dyJ9.qCAXLDVX6Ntro2JmrE_OMA",
                  additionalOptions: {
                    'accessToken':
                        "pk.eyJ1IjoiZGVlZGltYTMiLCJhIjoiY2t1Ynd2NzRwMHY0ODJubzNtbXBqcTE5dyJ9.qCAXLDVX6Ntro2JmrE_OMA",
                    "id": "mapbox.mapbox-streets-v8"
                  },
                  attributionBuilder: (_) {
                    return Text("© OpenStreetMap contributors");
                  },
                ),
                MarkerLayerOptions(
                  markers: [
                  Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      builder: (ctx) => Column(
                        children: [
                          Text("Your Location"),
                          Icon(Icons.location_pin, color: Colors.red),
                        ]
                      ),
                    ),
                ],
                ),
              ],
            );
          } else {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
        });
  }
}
