import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'scanner.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Positioned(

              child: Image.asset(
                "images/almoco.jpg",
              ),
            ),

            Positioned(
              top: 100,
              left: 50,
              child: Text('Restaurante  Universitário',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),

            Positioned(
              top: 250,
              child: Container(
                padding: EdgeInsets.only(top:40, left: 50, right: 50, bottom: 50),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(62),
                    topRight: Radius.circular(62)
                  )
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'CPF'
                      )
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 62),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Senha'
                        ),
                      ),
                    ),

                    Container(
                      height: 45,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(32)
                        ),
                      ),
                      child: Center(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.deepPurpleAccent,
                          elevation: 0,
                          child: Text('Login'),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Scanner()));
                          },
                        ) 
                        
                      ),
                    ),


                    Container(height: 8,),
                    Text("",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),

                    // Container(height: 70,),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[

                    //     Container(
                    //       width: 60,
                    //       height: 60,
                    //       decoration: BoxDecoration(
                    //           color: Colors.grey[300],
                    //           borderRadius: BorderRadius.all(
                    //               Radius.circular(100)
                    //           )
                    //       ),
                    //       child: Center(
                    //         child: Icon(Icons.face,
                    //           color: Colors.grey[700],
                    //         ),
                    //       ),
                    //     ),

                    //     Container(width: 30,),

                    //     Container(
                    //       width: 60,
                    //       height: 60,
                    //       decoration: BoxDecoration(
                    //           color: Colors.grey[300],
                    //           borderRadius: BorderRadius.all(
                    //               Radius.circular(100)
                    //           )
                    //       ),
                    //       child: Center(
                    //         child: Icon(Icons.fingerprint,
                    //           color: Colors.grey[700],
                    //         ),
                    //       ),
                    //     ),

                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}