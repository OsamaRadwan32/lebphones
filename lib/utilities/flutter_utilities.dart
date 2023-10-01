import 'package:url_launcher/url_launcher.dart';

class FlutterUtilities {
  // Open WhatsApp Utilities
  static void openWhatsApp(String phoneName) async {
    String phoneNumber = '+9613156478';
    String message =
        'Hello LebPhones,\nI would like to order a $phoneName please!';
    String whatsAppLink = "https://wa.me/$phoneNumber?text=$message";
    if (await canLaunch(whatsAppLink)) {
      await launch(whatsAppLink);
    } else {
      throw 'Could not launch $whatsAppLink';
    }
  }
}
