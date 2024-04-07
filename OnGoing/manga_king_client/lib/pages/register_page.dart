import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_king_client/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.purple[50],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Welcome back
            const Text(
              "Create Your Account !!",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            //Your Name
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.portrait),
                hintText: "Enter Your Name",
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            //TextField Mobile number
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.phone_android),
                hintText: "Enter Your Mobile Number",
                labelText: 'Mobile Number',
              ),
            ),
            const SizedBox(height: 20),
            //Login Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: const Text('Register'),
            ),
            const SizedBox(height: 5),
            //Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an Account ?'),
                TextButton(
                  onPressed: () {
                    //Navigation
                    Get.to(const LoginPage());
                  },
                  child: const Text(
                    "Login Here",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
