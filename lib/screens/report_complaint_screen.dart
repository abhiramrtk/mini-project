import 'package:flutter/material.dart';

class ReportComplaintScreen extends StatefulWidget {
  const ReportComplaintScreen({super.key});

  @override
  State<ReportComplaintScreen> createState() =>
      _ReportComplaintScreenState();
}

class _ReportComplaintScreenState extends State<ReportComplaintScreen> {
  String? complaintType;
  String? category;
  final TextEditingController detailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D3B66),
        title: const Text("Report Complaint"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dropdown("Select Complaint Type", complaintType,
                ["Power Failure", "Low Voltage", "Transformer Issue"],
                (v) => setState(() => complaintType = v)),

            const SizedBox(height: 15),

            _dropdown("Category", category,
                ["Residential", "Commercial", "Street Light"],
                (v) => setState(() => category = v)),

            const SizedBox(height: 15),

            const Text("Complaint Details"),
            const SizedBox(height: 8),
            TextField(
              controller: detailsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Describe the problem",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                label: const Text("Upload Image"),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Text("Map Location Here")),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D3B66)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Complaint Submitted")),
                  );
                },
                child: const Text("Submit Complaint",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown(String hint, String? value, List<String> items,
      Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
