import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfViewer extends StatefulWidget {
  final String url;

  PdfViewer({required this.url});

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool _isLoading = true;
  String _filePath = "";

  @override
  void initState() {
    super.initState();
    _loadPdfFromUrl();
  }

  _loadPdfFromUrl() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var dio = Dio();
      var response = await dio.get(widget.url,
          options: Options(responseType: ResponseType.bytes));

      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/myPdf.pdf");

      await file.writeAsBytes(response.data);

      setState(() {
        _isLoading = false;
        _filePath = file.path;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Screen")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: _filePath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageSnap: false,
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
            ),
    );
  }
}
