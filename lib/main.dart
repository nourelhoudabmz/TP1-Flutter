import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1 Application',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'TP1 Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _montantController = TextEditingController();
  bool _isEuroToDinar = true;
  String _result = '';

  void _convert() {
    double money = double.tryParse(_montantController.text) ?? 0;
    double result;
    if (_isEuroToDinar) {
      result = money * 3.4;
    } else {
      result = money / 3.4;
    }
    setState(() {
      _result =
          'Le résultat est ${result.toStringAsFixed(3)} ${_isEuroToDinar ? 'dinars' : 'euros'} !';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _montantController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Montant',
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: false,
                          groupValue: _isEuroToDinar,
                          onChanged: (value) {
                            setState(() {
                              _isEuroToDinar = value ?? false;
                            });
                          },
                          activeColor: Colors.purple,
                        ),
                        Text('Dinar -> Euro'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: _isEuroToDinar,
                          onChanged: (value) {
                            setState(() {
                              _isEuroToDinar = value ?? true;
                            });
                          },
                          activeColor: Colors.purple,
                        ),
                        Text('Euro -> Dinar'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  _result,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
              ElevatedButton(
  onPressed: _convert,
  child: Text('CONVERTIR'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple[200], // Remplace `primary` par `backgroundColor`
    padding: EdgeInsets.symmetric(vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}