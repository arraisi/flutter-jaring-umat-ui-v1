import 'package:flutter/material.dart';
import 'src/app.dart';

checkIfAuthenticated() async {
  await Future.delayed(Duration(seconds: 3));
  return true;
}

void main(){
  App();
}

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    checkIfAuthenticated().then((_) async {
      Navigator.of(context).pushReplacementNamed('/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset('assets/logo/logo_size_4X.png', width: 220,)
      ),
    );
  }
}
