// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movieele/resultfinal.dart';

import 'movieresults.dart';

class loadingresult extends StatefulWidget {
  var id;
  loadingresult({@required this.id});

  @override
  State<loadingresult> createState() => _loadingresultState();
}

class _loadingresultState extends State<loadingresult> {
  var id;
  var p;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    getdetails(id);
  }

  void getdetails(var i) async {
    Response r = await get(Uri.parse(
        "https://imdb-api.com/en/API/Title/k_0livd10d/$i/FullActor,Images,Ratings,"));
    var body = jsonDecode(r.body);
    p = body;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return result(data: p);
        }),
      ),
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
        backgroundColor: Colors.grey[900],
        body: Center(
          child: SpinKitRotatingCircle(
            color: Color(0xFFFe50914),
            size: 50.0,
          ),
        ),
      ),
    ));
  }
}
