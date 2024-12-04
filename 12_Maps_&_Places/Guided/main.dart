import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart'; // Pastikan package ini sudah di-install
import 'package:google_maps_webservice/places.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );
  LatLng? _pickedLocation;

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        infoWindow: InfoWindow(title: 'Marker 1'),
        rotation: 90,
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(-6.9733165, 107.6281415),
      ),
      if (_pickedLocation != null)
        Marker(
          markerId: MarkerId("picked_location"),
          position: _pickedLocation!,
          infoWindow: InfoWindow(title: 'Picked Location'),
        ),
    };
  }

  void _showPlacePicker() async {
    // Masukkan API Key Google Maps Anda di sini
    const String apiKey = "AIzaSyDzh7A_sKdL0UYtWvSqBnOfrwlQjI_uQDQ";

    var result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _pickedLocation =
            LatLng(result.latLng.latitude, result.latLng.longitude);
      });
      print("Picked Location: ${result.latLng}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps with Place Picker'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: _showPlacePicker,
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
        markers: _createMarker(),
      ),
    );
  }
}
