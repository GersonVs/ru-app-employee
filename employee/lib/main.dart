import 'package:employee/bloc.dart';
import 'package:flutter/material.dart';
import 'scanner.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}



class HomePage extends StatelessWidget {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Scanner()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin:  Alignment.topRight,
            end:  Alignment.bottomLeft,
            colors: [Color(0xff673AB7), Color(0xff64B5F6)]
          )
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 80),
              Image.asset(
                'images/LOGORUFAL.png', scale: 2, 
                  height: 200,
              ),
              
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100),
                    StreamBuilder<String>(
                      stream: bloc.email,
                      builder: (context, snapshot) => TextField(
                        onChanged: bloc.emailChanged,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Digite o CPF",
                          labelText: "CPF",
                          filled:  true,
                          errorText: snapshot.error),
                    ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  StreamBuilder<String>(
                    stream: bloc.password,
                    builder: (context, snapshot) => TextField(
                      onChanged: bloc.passwordChanged,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(20) 
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Digite a senha",
                          labelText: "Senha",
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xff7067e4),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding:  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: snapshot.hasData
                          ? () => changeThePage(context)
                          : null,
                          child: Text(
                            "Entrar", 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold
                            )), 
                      )
                    ),
              ),
            ],
          ),
          
        ),

            ],
          ),
        )
          
      ),
    );
  }
}