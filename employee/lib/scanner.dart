import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'main.dart';

class Scanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scanner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Escaneie o Codigo QR do cliente'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter, _value = "";

  Future _incrementCounter() async {
    _counter = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancelar", true);

    setState(() {
		_value = _counter;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
                padding: EdgeInsets.only(left: 12),
                child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Scanner()));
                  },
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                   Text('Funcionário', style: TextStyle(fontWeight: FontWeight.bold),),
                   
                ]
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ],
              
            ),
            body: Center(
              
              child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Valor do QrCode: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  _value,
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
              ),
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: _incrementCounter,
        tooltip: 'Scanner',
        child: Icon(Icons.settings_overscan),
      ), 
    );
  }
}
