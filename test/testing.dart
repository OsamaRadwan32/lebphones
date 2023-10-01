import 'package:flutter/material.dart';
import 'package:lebphones/services/api_consumer.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    APIConsumer phoneLibrary = new APIConsumer();
    return FutureBuilder(
        future: phoneLibrary.apiProvider(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var output = snapshot.error;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              '$output',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          );
        });
  }
}
