// ignore_for_file: use_build_context_synchronously

import 'dart:convert';


import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'movieresults.dart';

class loading extends StatefulWidget {
  var moviename;
  loading({@required this.moviename});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  var moviename;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    moviename = widget.moviename;
     getdetails(moviename);
  }

  void getdetails(var mv) async {
    Response r = await get(
        Uri.parse("https://imdb-api.com/en/API/SearchMovie/k_0livd10d/$mv"));
    var body = jsonDecode(r.body);
    var p = body["results"];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return results(re: p);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Loading",
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOADING'),
          elevation: 3,
          backgroundColor: Color(0xFFFe50914),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          color: Colors.grey[900],
          child: Center(
            child: SpinKitRotatingCircle(
              color: Color(0xFFFe50914),
              size: 50.0,
            ),
          ),
        ),
      ),
    ));
  }
}
