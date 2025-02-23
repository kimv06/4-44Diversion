import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/main.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({super.key});

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  List hospitals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHospitals();
  }

  Future<void> fetchHospitals() async {
    const String apiKey = "AIzaSyDtNrQSq-Uc8nmqY2nfn67sPQtMo-WDZm8";
    const String url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=22.9571399,88.3724836&radius=5000&type=hospital&key=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          hospitals = data['results'];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load hospitals");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching hospitals: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(title: const Text("Nearby Hospitals")),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : hospitals.isEmpty
                ? const Center(child: Text("No hospitals found"))
                : ListView.builder(
                    itemCount: hospitals.length,
                    itemBuilder: (context, index) {
                      final hospital = hospitals[index];
                      return ListTile(
                        leading: const Icon(Icons.local_hospital, color: Colors.white),
                        title: Text(hospital['name'] ?? "Unknown"),
                        subtitle: Text(hospital['vicinity'] ?? "No address"),
                        trailing: Text(
                            "Lat: ${hospital['geometry']['location']['lat']}, Lng: ${hospital['geometry']['location']['lng']}"),
                      );
                    },
                  ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart'; // For location
// import 'package:http/http.dart' as http; // For API calls
// import 'dart:convert';

// class SOSScreen extends StatefulWidget {
//   const SOSScreen({super.key});

//   @override
//   _SOSScreenState createState() => _SOSScreenState();
// }

// class _SOSScreenState extends State<SOSScreen> {
//   bool _isSOSActive = false;
//   Position? _currentLocation;

//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     _currentLocation = await Geolocator.getCurrentPosition();
//     setState(() {}); // Update UI
//   }

//   Future<void> _sendSOS() async {
//     if (_currentLocation == null) {
//       await _getCurrentLocation(); // Get location if not available
//       if (_currentLocation == null) {
//         // Handle the case where location is still not available
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Could not get location.')));
//         return;
//       }
//     }

//     setState(() {
//       _isSOSActive = true;
//     });

//     // Example using http package (replace with your actual API endpoint and data format)
//     final url = Uri.parse('AIzaSyDtNrQSq-Uc8nmqY2nfn67sPQtMo-WDZm8'); // *REPLACE THIS*
//     final data = {
//       'latitude': _currentLocation!.latitude,
//       'longitude': _currentLocation!.longitude,
//     };

//     try {
//       final response = await http.post(url,
//           body: jsonEncode(data),
//           headers: {'Content-Type': 'application/json'});
//       if (response.statusCode == 200) {
//         // Success!
//         print('SOS sent successfully!');
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('SOS sent successfully!')));
//       } else {
//         // Error
//         print('Error sending SOS: ${response.statusCode}');
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Error sending SOS.')));
//       }
//     } catch (e) {
//       print('Error sending SOS: $e');
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error sending SOS.')));
//     }

//     setState(() {
//       _isSOSActive = false; // Reset SOS button
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('SOS App')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 _sendSOS(); // Call the SOS function
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.all(20),
//                 textStyle: const TextStyle(fontSize: 24),
//               ),
//               child: Text(_isSOSActive ? 'Sending SOS...' : 'SOS'),
//             ),
//             if (_currentLocation != null)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                     'Location: ${_currentLocation!.latitude}, ${_currentLocation!.longitude}'),
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const HospitalListPage()),
//                 );
//               },
//               child: const Text('Nearby Hospitals'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HospitalListPage extends StatelessWidget {
//   const HospitalListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // This is a placeholder for the hospital list.
//     // You can replace this with your actual implementation to fetch and display nearby hospitals.
//     return Scaffold(
//       appBar: AppBar(title: const Text('Nearby Hospitals')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text('List of nearby hospitals will be displayed here.'),
//             // You can implement your API call to fetch hospitals here.
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SOSScreen(),
//   ));
// }