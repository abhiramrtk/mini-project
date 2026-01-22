import 'package:flutter/material.dart';

class MyComplaintsScreen extends StatelessWidget {
  const MyComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF0D3B66),
        title: const Text("Complaint Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications),
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ComplaintCard(
            id: "CMP12345",
            title: "Power Outage",
            date: "12 Dec 2025",
            status: "Pending",
          ),
          ComplaintCard(
            id: "CMP12347",
            title: "Voltage Issue",
            date: "12 Dec 2025",
            status: "In Progress",
          ),
          ComplaintCard(
            id: "CMP12340",
            title: "Billing Problem",
            date: "12 Dec 2025",
            status: "Pending",
          ),
          ComplaintCard(
            id: "CMP12343",
            title: "Voltage Issue",
            date: "12 Dec 2025",
            status: "Resolved",
          ),
        ],
      ),

      
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String status;

  const ComplaintCard({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.status,
  });

  Color getStatusColor() {
    if (status == "Resolved") return Colors.green;
    if (status == "In Progress") return Colors.blue;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: $id",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(title,
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 6),
                Text("$date  •  $status",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: getStatusColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
