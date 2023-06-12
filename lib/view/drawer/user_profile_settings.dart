import 'package:flutter/material.dart';
import 'package:test_app/core/shared/components/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Container(
        color: kdefaultColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/onboard1.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildProfileItem(Icons.location_on, 'San Francisco, CA'),
                    const SizedBox(height: 10),
                    _buildProfileItem(Icons.email, 'john.doe@example.com'),
                    const SizedBox(height: 10),
                    _buildProfileItem(Icons.phone, '(123) 456-7890'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}