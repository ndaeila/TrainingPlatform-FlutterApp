import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadTextFile extends StatefulWidget {
  const ReadTextFile({Key? key, required this.textURL});

  final String textURL;

  @override
  _ReadTextFileState createState() => _ReadTextFileState();
}

class _ReadTextFileState extends State<ReadTextFile> {
  String dataFromFile = "";

  Future<void> readText() async {
    final String response = await rootBundle.loadString(widget.textURL);
    setState(() {
      dataFromFile = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    readText();
    return Container(
      child: Text(dataFromFile),
    );
  }
}
