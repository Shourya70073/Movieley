// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'loadingscreen.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('M O V I E L E Y'),
        elevation: 3,
        backgroundColor: Color(0xFFFe50914),
        leading: Icon(Icons.menu),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://assets.nflxext.com/ffe/siteui/vlv3/c732cb00-be61-4d64-b8c3-99f022e7a123/eceef24d-4920-430f-988b-d2f48f8ad060/IN-en-20220620-popsignuptwoweeks-perspective_alpha_website_medium.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("image/logo.png"),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.red,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search a Movie..'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: MaterialButton(
                      onPressed: () {
                        var s = _controller.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return loading(moviename: s);
                          }),
                        );
                      },
                      child: Text(
                        "SEARCH",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFFFe50914),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
