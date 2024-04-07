import 'package:flutter/material.dart';
import 'package:footware_client/controller/login_controller.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:footware_client/widgets/otp_txt_field.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (ctrl) {
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
                  controller: ctrl.registerNameCtrl,
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
                  controller: ctrl.registerNumberCtrl,
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
                OtpTextField(
                  otpController: ctrl.otpController,
                  visible: ctrl.otpFieldShow,
                  onComplete: (otp) {
                    ctrl.otpEntered = int.parse(otp ?? '0000');
                  },
                ),
                const SizedBox(height: 20),
                //Otp Button
                ElevatedButton(
                  onPressed: () {
                    ctrl.otpFieldShow ? ctrl.addUser() : ctrl.sendOtp();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  child: Text(ctrl.otpFieldShow ? 'Register' : 'Send OTP'),
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
      },
    );
  }
}
