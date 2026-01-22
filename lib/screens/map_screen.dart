import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Map<String, dynamic>? selectedComplaint;

  final List<Map<String, dynamic>> complaints = [
    {
      "title": "Power Outage",
      "location": "Kallai",
      "upvotes": 16,
      "lat": 11.2588,
      "lng": 75.7804
    },
    {
      "title": "Transformer Issue",
      "location": "Thiruthiyad",
      "upvotes": 10,
      "lat": 11.2700,
      "lng": 75.7850
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NearBy Complaints"),
      ),

      body: Stack(
        children: [

          /// MAP
FlutterMap(
  options: MapOptions(
    initialCenter: const LatLng(11.2588, 75.7804), // Kozhikode
    initialZoom: 13,
  ),
  children: [
    TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      userAgentPackageName: 'com.example.kseb',
    ),

    MarkerLayer(
      markers: complaints.map((c) {
        return Marker(
          point: LatLng(c["lat"], c["lng"]),
          width: 40,
          height: 40,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedComplaint = c;
              });
            },
            child: const Icon(
              Icons.flash_on,
              color: Colors.red,
              size: 35,
            ),
          ),
        );
      }).toList(),
    ),
  ],
),


          /// BOTTOM CARD
          if (selectedComplaint != null)
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: _complaintCard(),
            ),
        ],
      ),
    );
  }

  Widget _complaintCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedComplaint!["title"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(selectedComplaint!["location"]),
            const SizedBox(height: 10),

            Row(
              children: [
                Text("${selectedComplaint!["upvotes"]} Upvotes"),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      selectedComplaint!["upvotes"]++;
                    });
                  },
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("Upvote"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
