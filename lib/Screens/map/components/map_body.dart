import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MapScreenBody());
}

class MapScreenBody extends StatefulWidget {
  const MapScreenBody({super.key});

  @override
  State<MapScreenBody> createState() => _MapScreenBodyState();
}

class _MapScreenBodyState extends State<MapScreenBody> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(7.432887960829259, 80.44509724406463);
  double? myLocationLat;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      //print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) async {
            final location = Location();
            final currentLocation = await location.getLocation();
            myLocationLat = currentLocation.latitude;
          },
          initialCameraPosition: CameraPosition(target: _center, zoom: 12.0),
        ),
      ),
    );
  }
}
