import 'package:flutter/material.dart';
import 'package:kseb_connect/screens/main_layout.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "KSEB ",
                      style: TextStyle(
                        color: Color(0xFF0D3B66),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "CONNECT",
                      style: TextStyle(
                        color: Color(0xFF4CAF50),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              const Text("Welcome Back",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Enter your name and number",
                  style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 30),

              const Text("Name"),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text("Number"),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "+91 1234561234",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    value: keepSignedIn,
                    onChanged: (v) => setState(() => keepSignedIn = v!),
                  ),
                  const Text("Keep me signed in"),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D3B66),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MainLayout()),
                    );
                  },
                  child: const Text("Continue",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
