import 'dart:typed_data';
import 'package:flutter/material.dart';
 import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintableData extends StatefulWidget {
  final String path;
  const PrintableData({Key? key,required this.path}) : super(key: key);

  @override
  State<PrintableData> createState() => _PrintableDataState();
}


class _PrintableDataState extends State<PrintableData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => createPdf(format),
      ),
    );
  }

  Future<Uint8List> createPdf(PdfPageFormat format) async {
    final pdf = pdfWid.Document();
    final qrPainter = QrPainter(
      data: widget.path,
      version: QrVersions.auto,
    );
    final qrImageData = await qrPainter.toImageData(300);

    pdf.addPage(
      pdfWid.Page(
        build: (context) {
          return pdfWid.Center(
            child: pdfWid.Image(pdfWid.MemoryImage(qrImageData!.buffer.asUint8List())),
          );
        },
      ),
    );

    return pdf.save();
  }
}
