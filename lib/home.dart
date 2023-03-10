import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'material.dart';

const LatLng currentLocation = LatLng(28.589585764126245, 77.09185663285109);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: currentLocation, zoom: 14),
        onMapCreated: (controller) {
          _mapController = controller;
          addMarker('test', currentLocation);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  addMarker(String Id, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(Id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Title of place',
        snippet: 'some description of the place',
      ),
    );

    _markers[Id] = marker;
    setState(() {});
  }
}
