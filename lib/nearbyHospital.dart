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
