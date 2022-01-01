import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadTextFile extends StatefulWidget {
  const ReadTextFile(String textURL, {Key? key}) : super(key: key);

  @override
  _ReadTextFileState createState() => _ReadTextFileState();
}

class _ReadTextFileState extends State<ReadTextFile> {
  String dataFromFile = "";

  Future<void> readText() async {
    final String response = await rootBundle.loadString(textURL);
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
