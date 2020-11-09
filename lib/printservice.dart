import 'dart:convert';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

class PrintService {
  static final PrinterNetworkManager printerManager = PrinterNetworkManager();

  static Future<String> printReceipt(
    List order,
    String ip,
    int printport,
  ) async {
    // if (orderJson.length > 1) {
      printerManager.selectPrinter(ip, port: printport);
      final PosPrintResult res =
          await printerManager.printTicket(await testTicket(order));
      return 'Print result: ${res.msg}';
    // } else {
    //           return "Error: No Ip or Port included in the request";
    //   // if (order.containsKey("Port")) {
    //   //   return "Error: No Ip, please include key: 'IP'";
    //   // } else {
    //   //   return "Error: No Port, please include key 'Port'";
    //   // }
    // }
  }

  static Future<Ticket> testTicket(List order) async {
    final profile = await CapabilityProfile.load();
    final Ticket ticket = Ticket(PaperSize.mm80, profile);
    PosTextSize globalHeight = PosTextSize.size1;
    PosTextSize globalwidth = PosTextSize.size1;
    // if (order.containsKey("Document data")) {
      order.forEach((element) {
        if (element[0] == 'set font bold') {
          ticket.setStyles(PosStyles(
            bold: true,
          ));
        } else if (element[0] == 'set font unbold') {
          ticket.setStyles(PosStyles(
            bold: false,
          ));
        } else if (element[0] == 'set font double height') {
          if (globalHeight == PosTextSize.size1) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size2,
            ));
          } else if (globalHeight == PosTextSize.size2) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size3,
            ));
          } else if (globalHeight == PosTextSize.size3) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size4,
            ));
          } else if (globalHeight == PosTextSize.size4) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size5,
            ));
          } else if (globalHeight == PosTextSize.size5) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size6,
            ));
          } else if (globalHeight == PosTextSize.size6) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size7,
            ));
          } else if (globalHeight == PosTextSize.size7) {
            ticket.setStyles(PosStyles(
              height: PosTextSize.size8,
            ));
          }
        } else if (element[0] == 'set font large') {
          ticket.setStyles(PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ));
          globalHeight = PosTextSize.size2;
          globalwidth = PosTextSize.size2;
        } else if (element[0] == 'set font normal') {
          ticket.setStyles(PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size1,
          ));
          globalHeight = PosTextSize.size2;
          globalwidth = PosTextSize.size1;
        } else if (element[0] == 'align') {
          if (element[1] == "center") {
            ticket.setStyles(PosStyles(
              align: PosAlign.center,
            ));
          } else if (element[1] == "right") {
            ticket.setStyles(PosStyles(
              align: PosAlign.right,
            ));
          } else if (element[1] == "left") {
            ticket.setStyles(PosStyles(
              align: PosAlign.left,
            ));
          }
        } else if (element[0] == 'println') {
          if (element.length == 2) {
            ticket.text(element[1]);
          } else if (element.length == 1) {
            ticket.text("Error: println - command.text is null");
          }
        } else if (element[0] == 'draw line') {
          ticket.hr(ch: "_");
        } else if (element[0] == 'space line') {
          ticket.feed(1);
        } else if (element[0] == 'printlr') {
          if (element.length == 2) {
            ticket.row([
              PosColumn(
                text: element[1],
                width: 6,
                styles: PosStyles(align: PosAlign.center),
              ),
            ]);
          } else if (element.length == 3) {
            ticket.row([
              PosColumn(
                text: element[1],
                width: 6,
                styles: PosStyles(align: PosAlign.left),
              ),
              PosColumn(
                text: element[2],
                width: 6,
                styles: PosStyles(align: PosAlign.left),
              ),
            ]);
          }
        }
      });
    // } else {
    //   ticket.text("Key: (Document data) is missing");
    // }

    ticket.feed(2);
    ticket.cut();
    return ticket;
  }
}
