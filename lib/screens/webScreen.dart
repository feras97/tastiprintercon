import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tastiiCom/printservice.dart';

// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';

class WebScreenView extends StatefulWidget {
  final String url;
  WebScreenView(this.url);

  @override
  _WebScreenViewState createState() => _WebScreenViewState();
}

class _WebScreenViewState extends State<WebScreenView> {
  InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: InAppWebView(
          initialUrl: widget.url,
          initialHeaders: {},
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              // debuggingEnabled: true,
              javaScriptEnabled: true,
              useShouldOverrideUrlLoading: true,
              useOnLoadResource: true,
              // cacheEnabled: true,
            ),
          ),
          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            return ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED);
          },
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
            controller.reload();
            controller.addJavaScriptHandler(
                handlerName: "print",
                callback: (arguments) async {
                  // await PrintService.printReceipt(arguments);
                  // print("arggggggggggggg:");
                  // var temp = jsonDecode(arguments[0]);
                  // print("Ip type: " + arguments[1].runtimeType.toString());
                  // print(arguments[1]);
                  // print("Port type: " + arguments[2].runtimeType.toString());
                  // print(arguments[2]);

                  print("data: ");
                  List data = jsonDecode(arguments[0]);
                  // data.forEach((value) {
                  //   print(value[0]);
                  //   print(value[1]);
                  // });
                  await PrintService.printReceipt(
                      data, arguments[1], arguments[2]);

                  return "done";
                  // print(arguments);
                  // String arguments_ = json.encode(arguments);
                  // String jsCode = "window.callback('print',$arguments_)";
                  // await controller.evaluateJavascript(source: jsCode);
                });
          },
          onConsoleMessage: (InAppWebViewController controller,
              ConsoleMessage consoleMessage) {
            print("console message: ${consoleMessage.message}");
          },
        ),
      ),
    );
  }
}
