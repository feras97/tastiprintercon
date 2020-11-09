import 'package:flutter/material.dart';
import 'package:tastiiCom/screens/webScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: WebScreenView(
          // "https://feras97.github.io/tastitest/"),
        "https://test.d2g3893nwexi8q.amplifyapp.com"),
        // DataInputPrinter(),
      ),
      //   WebView(

      //         initialUrl:
      //         // "https://www.facebook.com",
      //         "https://feras97.github.io/FertastiCom/",
      //         javascriptMode: JavascriptMode.unrestricted,
      //         javascriptChannels: Set.from([
      //           JavascriptChannel(
      //               name: 'Print',
      //               onMessageReceived: (JavascriptMessage message) {
      //                 //This is where you receive message from
      //                 //javascript code and handle in Flutter/Dart
      //                 //like here, the message is just being printed
      //                 //in Run/LogCat window of android studio
      //                 print(message.message);
      //               })
      //         ]),
      //         onWebViewCreated: (WebViewController w) {
      //           WebViewController webViewController = w;
      //         },
      //       )
      // ),
    );
  }
}
