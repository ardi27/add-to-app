import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MethodChannel nativeChannel;
  String data = 'data : ';
  @override
  void initState() {
    super.initState();
    nativeChannel = MethodChannel('id.co.example');
    nativeChannel.setMethodCallHandler(setHandler);
  }

  Future<void> setHandler(MethodCall methodCall) async {
    if (methodCall.method == 'sendData') {
      data = '$data ${methodCall.arguments}';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello from flutter'),
        ),
        body: Center(
          child: Text(data),
        ),
      ),
    );
  }
}
