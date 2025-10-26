import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/main.dart';
import 'package:uts_mobile_programming/presentations/home_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.asset('assets/logo_aplikasi.png'),
          Text(
            "Email",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Masukkan Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Masukkan Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(12, 79, 115, 1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: SizedBox(
                width: 250,
                height: 24,
                child: Center(child: Text('Login', style: TextStyle(fontSize: 18),))
              )
            ),
          )
        ],
      ),
    ),)
    ,
    );
  }
}
