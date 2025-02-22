import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // For location
//import 'package:url_launcher/url_launcher.dart'; // For maps/phone calls
import 'package:http/http.dart' as http; // For API calls (if needed)
import 'dart:convert';

import 'package:myapp/nearbyHospital.dart'; // For JSON handling (if needed)

class SOSScreen extends StatefulWidget {
  const SOSScreen({super.key});

  @override
  _SOSScreenState createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  bool _isSOSActive = false;
  Position? _currentLocation;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _currentLocation = await Geolocator.getCurrentPosition();
    setState(() {}); // Update UI
  }

  Future<void> _sendSOS() async {
    if (_currentLocation == null) {
      await _getCurrentLocation(); // Get location if not available
      if (_currentLocation == null) {
        // Handle the case where location is still not available
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Could not get location.')));
        return;
      }
    }

    setState(() {
      _isSOSActive = true;
    });

    // 1. Send Location to Hospital (using API - preferred)
    // Example using http package (replace with your actual API endpoint and data format)
    final url = Uri.parse('YOUR_HOSPITAL_API_ENDPOINT'); // *REPLACE THIS*
    final data = {
      'latitude': _currentLocation!.latitude,
      'longitude': _currentLocation!.longitude,
      // ... any other data you need to send (e.g., user info)
    };

    try {
      final response = await http.post(url,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        // Success!
        print('SOS sent successfully!');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('SOS sent successfully!')));
      } else {
        // Error
        print('Error sending SOS: ${response.statusCode}');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error sending SOS.')));
      }
    } catch (e) {
      print('Error sending SOS: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error sending SOS.')));
    }

    // 2. (Alternative) Open Maps App with Location (less ideal for automatic dispatch)
    // if (Platform.isAndroid) {
    //   String url =
    //       "https://www.google.com/maps/search/?api=1&query=${_currentLocation!.latitude},${_currentLocation!.longitude}";
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // } else if (Platform.isIOS) {
    //   String url =
    //       "http://maps.apple.com/?ll=${_currentLocation!.latitude},${_currentLocation!.longitude}";
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    setState(() {
      _isSOSActive = false; // Reset SOS button
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SOS App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                try {
                  print("Navigating to HospitalListPage...");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HospitalListPage()),
                  );
                  print("Navigation success!");
                } catch (e) {
                  print("Navigation Error: $e");
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                textStyle: const TextStyle(fontSize: 24),
              ),
              child: Text(_isSOSActive ? 'Sending SOS...' : 'SOS'),
            ),
            if (_currentLocation != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Location: ${_currentLocation!.latitude}, ${_currentLocation!.longitude}'),
              ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:location/location.dart';

// void main() {
//   runApp(const SOSApp());
// }

// class SOSApp extends StatelessWidget {
//   const SOSApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SOS App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const SOSScreen(),
//     );
//   }
// }

// class SOSScreen extends StatefulWidget {
//   const SOSScreen({super.key});

//   @override
//   State<SOSScreen> createState() => _SOSScreenState();
// }

// class _SOSScreenState extends State<SOSScreen> {
//   late GoogleMapController mapController;
//   LatLng _currentLocation = LatLng(0, 0);
//   Set<Marker> _markers = {};
//   Location location = Location();
//   late LocationData _currentLocationData;

//   // Google Maps Web Service client
//   final googleMaps = GoogleMapsPlaces(apiKey: 'YOUR_GOOGLE_API_KEY');

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//     _getLocation();
//   }

//   // Check for location permissions
//   Future<void> _checkPermissions() async {
//     var status = await Permission.location.request();
//     if (status.isGranted) {
//       _getLocation();
//     } else {
//       print('Location permission denied');
//     }
//   }

//   // Get current location
//   Future<void> _getLocation() async {
//     _currentLocationData = await location.getLocation();
//     setState(() {
//       _currentLocation = LatLng(
//         _currentLocationData.latitude!,
//         _currentLocationData.longitude!,
//       );
//     });
//     _fetchNearbyHospitals();
//   }

//   // Fetch nearby hospitals using Google Places API
//   Future<void> _fetchNearbyHospitals() async {
//     final result = await googleMaps.searchNearbyWithRadius(
//       Location(_currentLocation.latitude, _currentLocation.longitude),
//       5000, // Search radius in meters
//       type: "hospital", // Search for hospitals
//     );

//     setState(() {
//       _markers.clear();
//       for (var place in result.results) {
//         _markers.add(
//           Marker(
//             markerId: MarkerId(place.placeId ?? ''),
//             position: LatLng(
//               place.geometry!.location.lat,
//               place.geometry!.location.lng,
//             ),
//             infoWindow: InfoWindow(
//               title: place.name,
//               snippet: place.vicinity,
//             ),
//           ),
//         );
//       }
//     });
//   }

//   // Move map camera to user's location
//   void _moveToUserLocation() {
//     mapController.animateCamera(
//       CameraUpdate.newLatLngZoom(_currentLocation, 14),
//     );
//   }

//   // SOS button action
//   void _onSOSButtonPressed() {
//     _checkPermissions();
//     _moveToUserLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SOS App'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.location_on),
//             onPressed: _onSOSButtonPressed,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _currentLocation,
//               zoom: 14,
//             ),
//             markers: _markers,
//             onMapCreated: (controller) {
//               mapController = controller;
//             },
//           ),
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: ElevatedButton(
//               onPressed: _onSOSButtonPressed,
//               child: const Text('SOS'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 25.0), backgroundColor: Colors.red,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:permission_handler/permission_handler.dart';


// class SOSScreen extends StatefulWidget {
//   @override
//   _SOSScreenState createState() => _SOSScreenState();
// }

// class _SOSScreenState extends State<SOSScreen> {
//   bool _isSOSActive = false;
//   Position? _currentLocation;
//   List<Hospital> _nearbyHospitals = [];
//   Set<Marker> _markers = {};
//   GoogleMapController? _mapController;
//   bool _isLoading = false;

//   Future<void> _getCurrentLocation() async {
//     // ... (Permission and service check logic remains the same)

//     try {
//       _currentLocation = await Geolocator.getCurrentPosition();
//       setState(() {
//         _isLoading = false;
//       });
//       _getNearbyHospitals(); // Call after getting location
//     } catch (e) {
//       // ... (Error handling as before)
//     }
//   }

//   Future<void> _getNearbyHospitals() async {
//     if (_currentLocation == null) return;

//     setState(() {
//       _isLoading = true;
//     });

//     final apiKey = 'AIzaSyDXUY6i7OopJPsQqt_8UtXmJ0FrXdpErP0'; 

//     if (apiKey.isEmpty) {
//       // ... (API key missing error as before)
//       return;
//     }

//     final url = Uri.parse(
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentLocation!.latitude},${_currentLocation!.longitude}&radius=10000&type=hospital&key=$apiKey');

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         final status = jsonData['status'];

//         if (status == 'OK') {
//           final results = jsonData['results'] as List;
//           _nearbyHospitals = results.map((result) => Hospital.fromJson(result)).toList();

//           _markers.clear();
//           for (final hospital in _nearbyHospitals) {
//             _markers.add(Marker(
//               markerId: MarkerId(hospital.placeId),
//               position: hospital.location,
//               infoWindow: InfoWindow(title: hospital.name),
//             ));
//           }

//           setState(() {
//             _isLoading = false;
//           });
//         } else {
//           // ... (API error handling as before)
//         }
//       } else {
//         // ... (HTTP error handling as before)
//       }
//     } catch (e) {
//       // ... (Other error handling as before)
//     }
//   }

//   Future<void> _sendSOS() async {
//     setState(() {
//       _isSOSActive = true;
//       _isLoading = true;
//     });

//     await _getCurrentLocation(); // Get location first

//     if (_currentLocation != null) {
//       // Show hospitals (already done in _getCurrentLocation)

//       setState(() {
//         _isSOSActive = false;
//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isSOSActive = false;
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('SOS App')),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _isSOSActive ? null : _sendSOS,
//               child: Text(_isSOSActive ? 'Sending SOS...' : 'SOS'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(20),
//                 textStyle: TextStyle(fontSize: 24),
//               ),
//             ),
//             Expanded(
//               child: _currentLocation != null
//                   ? GoogleMap(
//                 mapType: MapType.normal,
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(_currentLocation!.latitude,
//                       _currentLocation!.longitude),
//                   zoom: 12.0,
//                 ),
//                 onMapCreated: (controller) => _mapController = controller,
//                 markers: _markers,
//               )
//                   : Center(child: Text("Getting Location...")),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _nearbyHospitals.length,
//                 itemBuilder: (context, index) {
//                   final hospital = _nearbyHospitals[index];
//                   return ListTile(
//                     title: Text(hospital.name),
//                     subtitle: Text(hospital.vicinity),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Hospital {
//   final String name;
//   final String vicinity;
//   final LatLng location;
//   final String placeId;

//   Hospital({required this.name, required this.vicinity, required this.location, required this.placeId});

//   factory Hospital.fromJson(Map<String, dynamic> json) {
//     return Hospital(
//       name: json['name'] ?? '',
//       vicinity: json['vicinity'] ?? '',
//       location: LatLng(
//         json['geometry']['location']['lat'] ?? 0.0,
//         json['geometry']['location']['lng'] ?? 0.0,
//       ),
//       placeId: json['place_id'] ?? '',
//     );
//   }
// }