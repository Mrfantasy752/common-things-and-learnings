import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/supabasecontroller.dart';

class SupabaseTrial extends StatelessWidget {
  SupabaseTrial({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final supabasecontroller = Provider.of<SupabaseTrialController>(context);
    // // authStateCheck();

    return Consumer<SupabaseTrialController>(
      builder: (context, controller, child) {
        // controller.authStateCheck();

        return Scaffold(
          body: Center(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "email"),
                      controller: email,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "password"),
                      controller: password,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          supabaseSignup(email.text, password.text);
                        },
                        child: Text("Signup")),
                    ElevatedButton(
                        onPressed: () {
                          supabaseSignin(email.text, password.text);
                        },
                        child: Text("login")),
                    ElevatedButton(
                        onPressed: () async {
                          await Supabase.instance.client.auth.signOut();
                        },
                        child: Text("signout")),
                  ]),
            ),
          ),
        );
      },
    );
  }
}

supabaseSignup(email, password) async {
  var response = await Supabase.instance.client.auth.signUp(email, password);

  if (response.error != null) {
    print(response.error);
  } else {
    print("the current user is : ${response.user!.email}");
  }
}

supabaseSignin(email, password) async {
  var response = await Supabase.instance.client.auth
      .signIn(email: email, password: password);

  if (response.error != null) {
    print(response.error);
  } else {
    print("the Logged in user is : ${response.user!.email}");
  }
}
