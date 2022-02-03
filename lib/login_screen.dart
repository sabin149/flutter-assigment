import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme.dart';

class LoginScreen extends StatelessWidget { 
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text("Login Screen"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Flexible(child: Image.asset("assets/images/mobile_login.png")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[ 
                    const TextField(
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                    const SizedBox(height: 10),
                   const TextField(
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child:const Text(
                          "Login", 
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                        
                        },
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
