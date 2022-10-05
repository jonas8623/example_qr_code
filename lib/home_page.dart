import 'package:example_qr_code/services/qr_code_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ticket = '';
  List<String> tickets = [];
  late QRCodeService qrCodeService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(ticket != '')
               Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Text('Ticket: $ticket', style: const TextStyle(fontSize: 20, color: Colors.white),),
              ),
            ElevatedButton.icon(
                onPressed: qrCode,
                icon: const Icon(Icons.qr_code),
                label: const Text('Validar')
            )
          ],
        ),
      ),
    );
  }

  void qrCode() async {
    qrCodeService = QRCodeImp();
    ticket = await qrCodeService.readerQRCode();
    setState(() {});
  }
}
