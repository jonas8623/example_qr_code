import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

abstract class QRCodeService {

  Future<String> readerQRCode();
  Future<void> readerListCodes({required List<String> list});
}

class QRCodeImp extends QRCodeService {

  @override
  Future<void> readerListCodes({required List<String> list}) async {
    Stream<dynamic>? reader = FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#FFFFFF",
        'Cancelar',
        true,
        ScanMode.QR
    );
    if(reader != null) {
      reader.listen((code) {
        if(!list.contains(code.toString()) && code != '-1') {
          list.add(code.toString());
        }
      });
    }
  }

  @override
  Future<String> readerQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF",
        'Cancelar',
        true,
        ScanMode.QR
    );
    String result = code != '-1' ? code : '';
    return result;
  }
}
