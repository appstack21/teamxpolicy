import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:teamxpolicy/teamxpolicy.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    platformVersion = "10";

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    generateToken();
  }

  String? sessionToken;
  void generateToken() async {
    var headers = {
      'App_ID': '9c27b069-561d-49f3-8322-bca159f1dae2',
      'App_Key': '6u9KLD`84:pY;)32I>,jd18!',
      'apiVersion': '1',
      'Resource': '95f3f01c-a430-467f-ac05-f8dd75c7affb',
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://apacuat.chubbdigital.com/enterprise.operations.authorization'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var responseValue = json.decode(result);
      setState(() {
        sessionToken = responseValue["access_token"];
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: CupertinoButton(
          child: const Text("Policy"),
          onPressed: () => {
            if (sessionToken != null)
              {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          TXPConfigurator.getPolicyListScreen(sessionToken!),
                      transitionDuration: const Duration(seconds: 0),
                      fullscreenDialog: false),
                )
              }
          },
        ),
      ),
    );
  }
}
