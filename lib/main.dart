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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo/logo_size_4X.png',),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Jaring Umat", style: TextStyle(fontFamily: 'sofiapro-bold', fontSize: 22),),
            )
          ],
        ),
      ),
    );
  }
}
