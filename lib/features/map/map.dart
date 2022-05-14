import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_information/features/navbar/navbar.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  //list of markers
  final Set<Marker> markers = Set();
   double lat = 27.7099116;
  double long = 85.3132343;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Google Map '),
      ), // AppBar
      body: GoogleMap(
        onTap: (LatLng latLng) {
        setState(() {
          lat = latLng.latitude;
          long = latLng.longitude;
        });

          print("getting position in ..${latLng.latitude}==${latLng.longitude} ");
        },
        markers:  <Marker>{
            Marker(
              onTap: () {

              },
              markerId: const MarkerId("showLocation.toString()"),
              position: LatLng(lat, long), //position of marker
              infoWindow:  InfoWindow(
                title: '$lat  $long',
                snippet: 'My Custom Subtitle',
              ),
              icon: BitmapDescriptor.defaultMarker, //Icon for Marker
            ),
          },
        initialCameraPosition: const CameraPosition(
          target: LatLng(22.5726, 88.3639),
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
