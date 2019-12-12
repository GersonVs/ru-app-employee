import 'package:flutter/material.dart';
import 'generateQrCode.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final cpfController = TextEditingController();

  @override
  void dispose(){
    cpfController.dispose();
    super.dispose();
  }

  _login(){
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(cpfController.text),
              );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff673AB7), Color(0xff64B5F6)]
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Image.asset(
                        'images/LOGORUFAL.png',
                        height: 150
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Restaurante Universitário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),  
                    ),
                    SizedBox(height: 15),
                    Container(
                        //height: 500,
                        width: 350,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 100),
                            TextField(
                                obscureText: false,
                                controller: cpfController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: 'CPF',
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: 'Senha',
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xff7067e4),
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                  },
                                  child: Text("Login",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  
                                },
                                child: Text(
                                  'Ainda não possuo cadastro',
                                  style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold
                                        ),
                                ),
                              ),
                          ],
                        ),
                    ),
                    SizedBox(height: 100),
                    Text(
                      '© Cangaceiros Dev',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),  
                    ),
                  ],
                ),
            ),
              ),
    );
  }
}