import 'package:catalift_assignment/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _nameState();
}

class _nameState extends State<loginscreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final purpleColor = Color(0xFF3D0075);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Illustration
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Image.asset(
                'lib/assets/logo.png', // Replace with your asset path
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),

            // Logo and Tagline
            Text(
              'CATALIFT',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: purpleColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Give your career an EXTRA boost',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: purpleColor,
              ),
            ),
            SizedBox(height: 30),

            // Sign-In Label and Privacy Policy
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign-In',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Privacy Policy', style: TextStyle(color: purpleColor)),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Phone Number Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                controller: emailcontroller,
              ),
            ),
            SizedBox(height: 12),

            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                obscureText: true,
                controller: passwordcontroller,
              ),
            ),

            // Forgot Password
            Padding(
              padding: const EdgeInsets.only(right: 32.0, top: 6),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Sign-In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final email = emailcontroller.text.trim();
                    final password = passwordcontroller.text.trim();
                    Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    ).signIn(email, password, context);
                  },
                  child: Text('Sign-In', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),

            // Sign-Up
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: RichText(
                text: TextSpan(
                  text: "Don’t Have An Account? ",
                  style: TextStyle(color: Colors.grey[700]),
                  children: [
                    TextSpan(
                      text: "Sign-Up",
                      style: TextStyle(
                        color: purpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
