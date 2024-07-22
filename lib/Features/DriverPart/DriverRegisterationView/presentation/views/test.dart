// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:yallanow/Core/utlis/AppStyles.dart';
// import 'package:http/http.dart' as http;

// class PdfPage extends StatefulWidget {
//   @override
//   _PdfPageState createState() => _PdfPageState();
// }

// class _PdfPageState extends State<PdfPage> {
//   final picker = ImagePicker();
//   File? _image;
//   Uint8List? _pdfData;

//   Future<void> _pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//       _createPdf();
//     }
//   }

//   Future<void> _createPdf() async {
//     final pdf = pw.Document();
//     final image = pw.MemoryImage(_image!.readAsBytesSync());

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(children: [
//             pw.Text("page 1"),
//             pw.SizedBox(height: 16),
//             pw.Expanded(child: pw.Image(image))
//           ]);
//         },
//       ),
//     );

//     final output = await getTemporaryDirectory();
//     final file = File("${output.path}/example.pdf");
//     await file.writeAsBytes(await pdf.save());
//     setState(() {
//       _pdfData = file.readAsBytesSync();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image to PDF Converter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null ? Text('No image selected.') : Image.file(_image!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 20),
//             _pdfData != null
//                 ? ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PdfViewer(),
//                         ),
//                       );
//                     },
//                     child: Text('View PDF'),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PdfViewer extends StatefulWidget {
//   PdfViewer();

//   @override
//   State<PdfViewer> createState() => _PdfViewerState();
// }

// class _PdfViewerState extends State<PdfViewer> {
//   Uint8List? _pdfData;

//   Future<void> _fetchPdf() async {
//     final url =
//         'https://pdf.usaid.gov/pdf_docs/Pnadl099.pdf'; // Replace with your API URL
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       setState(() {
//         _pdfData = response.bodyBytes;
//       });
//     } else {
//       // Handle error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load PDF')),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchPdf();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: _pdfData == null
//           ? Center(child: CircularProgressIndicator())
//           : PdfPreview(
//               build: (format) => _pdfData!,
//             ),
//     );
//   }
// }
