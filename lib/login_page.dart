import 'package:fixora/home_page.dart';
import 'package:fixora/selected_role_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var errorMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        color: Colors.blue.shade100, // Set the whole body background color
        child: Center(
          child: Container(
            width: 320, // Set a fixed width for the login form
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight:FontWeight.bold,
                  fontStyle: FontStyle.italic,

                ),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                    ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 2,
                    ),
                    ),
                    prefixIcon: Icon(Icons.email),
                    label: Text("Email"),

                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2,
                    ),
                    ),
                    label: Text("Password"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2,
                    ),
                    ),
                    prefixIcon: Icon(Icons.wifi_password),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    
                  }, child: Text("Forget password?")),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(onPressed: (){
                  String email = emailController.text.toString();
                  String password = passwordController.text;
                  
                  setState(() {
                    if(email.isEmpty || password.isEmpty){
                      errorMessage = 'Please enter the detail';
                    } else {
                      errorMessage = '';
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  });
                }, label: Text("Login"),
                icon: Icon(Icons.login),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
                if (errorMessage.isNotEmpty)
                  Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Don't have an account?")),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedRolePage()));
                      
                    },child: Text("Sign Up"),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
